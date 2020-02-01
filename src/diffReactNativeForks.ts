const {
  traverseDirectory,
  writeFile,
  getRelativePath,
  lookUpRelativePath,
  initDirectory,
  resolvePath,
} = require('./fs_utils');

const {createPatch} = require('./patch_utils');

const log = require('simple-node-logger').createSimpleFileLogger(
  'E:\\github\\office-android-patches\\patch-diff.log',
);

export function diffReactNativeForks(
  fbRepoAbsPath: string,
  forkRepoAbsPath: string,
  patchesRootAbsPath: string,
  topLevelBlackListDirs: string[] = [],
) {
  // Where we write the patches
  const bothPath = resolvePath(patchesRootAbsPath, 'both');
  const msOnlyPath = resolvePath(patchesRootAbsPath, 'msOnly');
  const fbOnlyPath = resolvePath(patchesRootAbsPath, 'fbOnly');

  // Init output directory
  initDirectory(bothPath);
  initDirectory(msOnlyPath);
  initDirectory(fbOnlyPath);

  const callbackFile = (forkFileAbsPath: string) => {
    const forkFileRelativePath = getRelativePath(
      forkFileAbsPath,
      forkRepoAbsPath,
    );

    const callbackOnHit = (fbRepoFileAbsPath: string) => {
      const callbackOnPatchCreated = (patch: string) => {
        // tslint:disable-next-line:no-console
        // console.log('Patch:: ' + patch);
        writeFile(bothPath, forkFileRelativePath, `${patch}`);
      };
      createPatch(fbRepoFileAbsPath, forkFileAbsPath, callbackOnPatchCreated);
    };

    const callbackOnMiss = (second: string) => {
      // tslint:disable-next-line:no-console
      console.log('Only in MS:: ' + forkFileAbsPath);
      // writeFile(msOnlyPath, msForkFileRelativePath, 'data');
    };

    lookUpRelativePath(
      fbRepoAbsPath,
      forkFileRelativePath,
      callbackOnHit,
      callbackOnMiss,
    );
  };

  const callbackDirectory = (path: string) => {
    // tslint:disable-next-line:no-console
    // console.log('Directory: ' + path);
  };

  traverseDirectory(
    forkRepoAbsPath,
    callbackFile,
    callbackDirectory,
    topLevelBlackListDirs,
  );
}
