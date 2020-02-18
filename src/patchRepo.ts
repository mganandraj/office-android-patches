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

const patchRepo: PatchRepoFuncType = (
  targetRepoAbsPath: string,
  patchNames: string[],
  options: IPatchCommandOptions,
) => {
  log.info('patchRepo', `targetRepoAbsPath: ${targetRepoAbsPath}`);
  log.info('patchRepo', `patchNames: ${patchNames}`);
  log.info('patchRepo', `options.patchStore: ${options.patchStore}`);
  log.info('patchRepo', `options.reverse: ${options.reverse}`);
  log.info('patchRepo', `options.patchExecutable: ${options.patchExecutable}`);

  log.info('patchRepo', `options.gitExecutable: ${options.gitExecutable}`);
  log.info('patchRepo', `options.cleanupRepos: ${options.cleanupRepos}`);

  const callbackFile = (
    patchFileAbsPath: string,
    patchFileRootAbsPath: string,
  ) => {
    const patchFileRelativePath = getRelativePath(
      patchFileAbsPath,
      patchFileRootAbsPath,
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
          options.reverse,
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
      } else {
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
          options.reverse,
        );
      }
    };

    lookUpRelativePath(
      targetRepoAbsPath,
      patchFileRelativePath,
      callbackOnHit,
      callbackOnMiss,
    );
  };

  const callbackDirectory = (path: string, rootAbsPath: string) => {
    // tslint:disable-next-line:no-console
    // console.log('Directory: ' + path);
  };

  patchNames.forEach(patchName => {
    const patchNameDirAbsPath = resolvePath(options.patchStore, patchName);
    traverseDirectory(
      patchNameDirAbsPath,
      '.',
      callbackFile,
      callbackDirectory,
      [],
    );
  });
};

export default patchRepo;
