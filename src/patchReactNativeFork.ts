const {
  traverseDirectory,
  writeFile,
  getRelativePath,
  lookUpRelativePath,
  initDirectory,
  resolvePath,
} = require('./fs_utils');

const log = require('simple-node-logger').createSimpleFileLogger(
  'E:\\github\\office-android-patches\\patch-apply.log',
);

log.set;

const {applyPatch} = require('./patch_utils');
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
        log.info(result);
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
