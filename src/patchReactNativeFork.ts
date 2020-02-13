import {
  traverseDirectory,
  writeFile,
  getRelativePath,
  lookUpRelativePath,
  initDirectory,
  resolvePath,
  copyFile,
  copyFileOverwrite,
  copyFile2Overwrite,
} from './fs_utils';
import {log} from './logger';
import {applyPatch} from './patch_utils';
import {isFileText, isFileBinary} from './file_type_utils';
import {IPatchCommandOptions, PatchRepoFuncType} from './types';

const patchReactNativeFork: PatchRepoFuncType = (
  targetRepoAbsPath: string,
  patchStoreAbsPath: string,
  options: IPatchCommandOptions,
) => {
  log.info('patchReactNativeFork', `targetRepoAbsPath: ${targetRepoAbsPath}`);
  log.info('patchReactNativeFork', `patchStoreAbsPath: ${patchStoreAbsPath}`);
  log.info(
    'patchReactNativeFork',
    `options.patchExecutable: ${options.patchExecutable}`,
  );

  log.info(
    'patchReactNativeFork',
    `options.gitExecutable: ${options.gitExecutable}`,
  );
  log.info(
    'patchReactNativeFork',
    `options.cleanupRepos: ${options.cleanupRepos}`,
  );

  const patchesBothAbsPath = resolvePath(patchStoreAbsPath, 'both');
  const patchesForkOnlyAbsPath = resolvePath(patchStoreAbsPath, 'fork-only');

  const callbackFile = (patchFileAbsPath: string) => {
    const patchFileRelativePath = getRelativePath(
      patchFileAbsPath,
      patchesBothAbsPath,
    );

    const callbackOnHit = (hitPatchFileAbsPath: string) => {
      if (!isFileBinary(patchFileAbsPath)) {
        applyPatch(
          hitPatchFileAbsPath,
          patchFileAbsPath,
          (result: string) => {
            log.info('PatchRNFork', result);
          },
          (result: string) => {
            log.error('PatchRNFork', result);
          },
          options.patchExecutable,
        );
      } else {
        // Overwrite the file.
        copyFileOverwrite(patchFileAbsPath, hitPatchFileAbsPath);
      }
    };

    const callbackOnMiss = (missedPatchFileAbsPath: string) => {
      log.error(
        'PatchRNFork',
        `File path with patches (${missedPatchFileAbsPath}) not found in the target repository.`,
      );

      if (isFileBinary(patchFileAbsPath)) {
        // If patch file is binary, we copy anyways.
        copyFile(patchFileAbsPath, missedPatchFileAbsPath);
      }
    };

    lookUpRelativePath(
      targetRepoAbsPath,
      patchFileRelativePath,
      callbackOnHit,
      callbackOnMiss,
    );
  };

  const callbackDirectory = (path: string) => {
    // tslint:disable-next-line:no-console
    // console.log('Directory: ' + path);
  };

  const callbackNewFile = (patchFileAbsPath: string) => {
    const patchFileRelativePath = getRelativePath(
      patchFileAbsPath,
      patchesForkOnlyAbsPath,
    );

    const callbackOnHit = (hitPatchFileAbsPath: string) => {
      log.error(
        'PatchRNFork',
        `File path with patches (${hitPatchFileAbsPath}) as new file, already found in the target repository.`,
      );

      // This case must be handles manually.
    };

    const callbackOnMiss = (missedPatchFileAbsPath: string) => {
      if (!isFileBinary(patchFileAbsPath)) {
        applyPatch(
          missedPatchFileAbsPath,
          patchFileAbsPath,
          (result: string) => {
            log.info('PatchRNFork', result);
          },
          (result: string) => {
            log.error('PatchRNFork', result);
          },
          options.patchExecutable,
        );
      } else {
        //
        copyFile(patchFileAbsPath, missedPatchFileAbsPath);
      }
    };

    lookUpRelativePath(
      targetRepoAbsPath,
      patchFileRelativePath,
      callbackOnHit,
      callbackOnMiss,
    );
  };

  const callbackNewDirectory = (path: string) => {
    // tslint:disable-next-line:no-console
    // console.log('Directory: ' + path);
  };

  traverseDirectory(
    patchesBothAbsPath,
    '.',
    callbackFile,
    callbackDirectory,
    [],
  );
  traverseDirectory(
    patchesForkOnlyAbsPath,
    '.',
    callbackNewFile,
    callbackNewDirectory,
    [],
  );
};

export default patchReactNativeFork;
