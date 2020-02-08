import {
  traverseDirectory,
  writeFile,
  getRelativePath,
  lookUpRelativePath,
  initDirectory,
  resolvePath,
  copyFile2,
} from './fs_utils';
import {diffFiles} from './patch_utils';
import {log} from './logger';
import {isFileText, isFileBinary} from './file_type_utils';
import {compareFiles} from './file_compare';

export function diffReactNativeForks(
  fbRepoAbsPath: string,
  forkRepoAbsPath: string,
  patchesRootAbsPath: string,
  topLevelBlackListDirs: string[] = [],
) {
  // Where we write the patches
  const bothPath = resolvePath(patchesRootAbsPath, 'both');
  const forkOnlyPath = resolvePath(patchesRootAbsPath, 'fork-only');
  const baseOnlyPath = resolvePath(patchesRootAbsPath, 'base-only');

  // Init output directory
  initDirectory(bothPath);
  initDirectory(forkOnlyPath);
  initDirectory(baseOnlyPath);

  const callbackFile = (forkFileAbsPath: string) => {
    const forkFileRelativePath = getRelativePath(
      forkFileAbsPath,
      forkRepoAbsPath,
    );

    const callbackOnHit = (fbRepoFileAbsPath: string) => {
      const callbackOnDiffCreated = (patch: string) => {
        writeFile(bothPath, forkFileRelativePath, `${patch}`, '');
      };
      const callbackOnError = (error: string) => {
        log.error('diffRNFork', error);
      };
      const callbackOnBinaryFilesCompare = (same: boolean) => {
        if (!same) {
          copyFile2(bothPath, forkFileRelativePath, forkFileAbsPath);
        } else {
          log.info(
            'diffRNFork',
            `Skip copying identical binary files: ${forkFileRelativePath}`,
          );
        }
      };
      const callbackOnBinaryFilesCompareError = (result: string) => {
        log.error('diffRNFork', `callbackOnBinaryFilesCompareError: ${result}`);
      };

      const handleBinaryFileInFork = () => {
        compareFiles(
          fbRepoFileAbsPath,
          forkFileAbsPath,
          callbackOnBinaryFilesCompare,
          callbackOnBinaryFilesCompareError,
        );
      };
      // If it's a binary file we copy it as is to the patches folder.
      if (isFileBinary(forkFileAbsPath)) {
        handleBinaryFileInFork();
      } else {
        diffFiles(
          fbRepoFileAbsPath,
          false /* new file*/,
          forkFileAbsPath,
          callbackOnDiffCreated,
          callbackOnError,
        );
      }
    };

    const callbackOnMiss = (fbRepoFileAbsPath: string) => {
      const callbackOnDiffCreated = (patch: string) => {
        writeFile(forkOnlyPath, forkFileRelativePath, `${patch}`, '');
      };
      const callbackOnError = (error: string) => {
        log.error('diffRNFork', error);
      };
      const handleBinaryFileInFork = () => {
        copyFile2(forkOnlyPath, forkFileRelativePath, forkFileAbsPath);
      };
      if (isFileBinary(forkFileAbsPath)) {
        handleBinaryFileInFork();
      } else {
        diffFiles(
          fbRepoFileAbsPath,
          true /* new file*/,
          forkFileAbsPath,
          callbackOnDiffCreated,
          callbackOnError,
        );
      }
    };

    lookUpRelativePath(
      fbRepoAbsPath,
      forkFileRelativePath,
      callbackOnHit,
      callbackOnMiss,
    );
  };

  const callbackDirectory = (path: string) => {};

  /*
  Pseudo-code
  1. Traverse through the fork rep
  2. For each file look for the same file in the base repo
  3. If the file is found in the base repo, then create and write the patch file to 'both' directory in the patch directory, keeping the same directory hierarchy.
  4. If the file is not found in the base repo, then create and write the patch file as a 'new file' to 'forkOnly' directory in the patch directory, keeping the same directory hierarchy.

  Please note that we currently don't traverse the base reporitory, assuming that all the files in the base repository are present in the fork also. Essentially, we expect the patches to be only additions.
  */
  traverseDirectory(
    forkRepoAbsPath,
    callbackFile,
    callbackDirectory,
    topLevelBlackListDirs,
  );
}
