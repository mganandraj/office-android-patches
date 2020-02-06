import {
  traverseDirectory,
  writeFile,
  getRelativePath,
  lookUpRelativePath,
  initDirectory,
  resolvePath,
} from './fs_utils';
import {log} from './logger';
import {applyPatch} from './patch_utils';

export function patchReactNativeFork(
  targetRepoAbsPath: string,
  patchesRootAbsPath: string,
) {
  const patchesBothAbsPath = resolvePath(patchesRootAbsPath, 'both');
  const patchesForkOnlyAbsPath = resolvePath(patchesRootAbsPath, 'fork-only');

  const callbackFile = (patchFileAbsPath: string) => {
    const patchFileRelativePath = getRelativePath(
      patchFileAbsPath,
      patchesBothAbsPath,
    );

    const callbackOnHit = (hitPatchFileAbsPath: string) => {
      applyPatch(
        hitPatchFileAbsPath,
        patchFileAbsPath,
        (result: string) => {
          log.info('PatchRNFork', result);
        },
        (result: string) => {
          log.error('PatchRNFork', result);
        },
      );
    };

    const callbackOnMiss = (missedPatchFileAbsPath: string) => {
      log.error(
        'PatchRNFork',
        `File path with patches (${missedPatchFileAbsPath}) not found in the target repository.`,
      );
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
    };

    const callbackOnMiss = (missedPatchFileAbsPath: string) => {
      applyPatch(
        missedPatchFileAbsPath,
        patchFileAbsPath,
        (result: string) => {
          log.info('PatchRNFork', result);
        },
        (result: string) => {
          log.error('PatchRNFork', result);
        },
      );
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

  traverseDirectory(patchesBothAbsPath, callbackFile, callbackDirectory, []);
  traverseDirectory(
    patchesForkOnlyAbsPath,
    callbackNewFile,
    callbackNewDirectory,
    [],
  );
}
