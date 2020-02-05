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

  const callbackFile = (patchFileAbsPath: string) => {
    const patchFileRelativePath = getRelativePath(
      patchFileAbsPath,
      patchesBothAbsPath,
    );

    const callbackOnHit = (hitPatchFileAbsPath: string) => {
      // const callbackOnPatchCreated = (patch: string) => {
      //   // tslint:disable-next-line:no-console
      //   // console.log('Patch:: ' + patch);
      //   writeFile(bothPath, forkFileRelativePath, `${patch}`);
      // };
      applyPatch(hitPatchFileAbsPath, patchFileAbsPath, (result: string) => {
        log.info('PatchRNFork', result);
      });
    };

    const callbackOnMiss = (missedPatchFileAbsPath: string) => {
      // tslint:disable-next-line:no-console
      console.log(
        'Patch file not found in target repo:: ' + missedPatchFileAbsPath,
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

  traverseDirectory(patchesBothAbsPath, callbackFile, callbackDirectory, []);
}
