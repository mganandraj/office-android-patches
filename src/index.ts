const {
  traverseDirectory,
  writeFile,
  getRelativePath,
  lookUpRelativePath,
  initDirectory,
} = require('./fs_utils');

const {createPatch} = require('./patch_utils');

const msPath = 'E:\\github\\ms-react-native-forpatch';
const fbPath = 'E:\\github\\fb-react-native-forpatch';

const bothPath =
  'E:\\github\\ms-react-native-forpatch\\office-android-patches\\both';
const msOnlyPath =
  'E:\\github\\ms-react-native-forpatch\\office-android-patches\\msOnly';
const fbOnlyPath =
  'E:\\github\\ms-react-native-forpatch\\office-android-patches\\fbOnly';

initDirectory(bothPath);
initDirectory(msOnlyPath);
initDirectory(fbOnlyPath);

// const callbackOnPatch = (patch: string) => {
//   // tslint:disable-next-line:no-console
//   console.log('Patch:: ' + patch);
// };
// createPatch(
//   'E:\\github\\ms-react-native-forpatch\\ReactAndroid\\build.gradle',
//   'E:\\github\\fb-react-native-forpatch\\ReactAndroid\\build.gradle',
//   callbackOnPatch,
// );

const callbackFile = (path: string) => {
  // tslint:disable-next-line:no-console
  // console.log('File: ' + path);

  const first = path;
  const firstRelativePath = getRelativePath(first, msPath);

  const callbackOnHit = (second: string) => {
    // tslint:disable-next-line:no-console
    // console.log('File in both:: ' + first + '::' + second);
    // writeFile(bothPath, firstRelativePath, 'data');

    const callbackOnPatch = (patch: string) => {
      // tslint:disable-next-line:no-console
      // console.log('Patch:: ' + patch);
      writeFile(bothPath, firstRelativePath, `${patch}`);
    };
    createPatch(first, second, callbackOnPatch);
  };
  const callbackOnMiss = (second: string) => {
    // tslint:disable-next-line:no-console
    console.log('Only in MS:: ' + first);
    // writeFile(msOnlyPath, firstRelativePath, 'data');
  };

  lookUpRelativePath(fbPath, firstRelativePath, callbackOnHit, callbackOnMiss);
};

const callbackDirectory = (path: string) => {
  // tslint:disable-next-line:no-console
  // console.log('Directory: ' + path);
};

// Places we don't want to look for changes
const topLevelBlackListDirs = [
  '.ado',
  '.appveyor',
  '.circleci',
  '.editorconfig',
  '.eslintignore',
  '.eslintrc',
  '.flowconfig',
  '.flowconfig.android',
  '.flowconfig.macos',
  '.git',
  '.gitattributes',
  '.github',
  '.github.flowconfig.android',
  '.gitignore',
  '.nvmrc',
  '.prettierrc',
  'bots',
  'Brewfile',
  //'build.gradle',
  //'CHANGELOG.json',
  //'CHANGELOG.md',
  //'cli.js',
  //'CODE_OF_CONDUCT.md',
  //'ContainerShip',
  //'CONTRIBUTING.md',
  'danger',
  'double-conversion',
  //'ECOSYSTEM.md',
  'flow',
  'flow-typed',
  'Folly',
  'follybuild',
  'glog',
  //'gradle',
  //'gradlew',
  //'gradlew.bat',
  //'IntegrationTests',
  'jest',
  'jest-preset.js',
  'jest.config.js',
  'jsc',
  //'KeepingRecent.md',
  'keystores',
  'lib',
  //'Libraries',
  //'LICENSE',
  //'LICENSE-docs',
  //'local-cli',
  'metadata',
  //'metro.config.js',
  'office-android-patches',
  //'package.json',
  'packages',
  //'processor',
  'React',
  //'react-native.config.js',
  //'react.gradle',
  'React.podspec',
  //'ReactAndroid',
  'ReactApple',
  //'ReactCommon',
  //'README.md',
  //'Releases.md',
  //'rn-get-polyfills.js',
  //'RNTester',
  'runXcodeTests.sh',
  //'scripts',
  //'settings.gradle.kts',
  'stubs',
  //'template',
  //'template.config.js',
  'third-party-podspecs',
  //'tools',
  'v8-docker-build',
  'website',
  'yarn.lock',
];

traverseDirectory(
  msPath,
  callbackFile,
  callbackDirectory,
  topLevelBlackListDirs,
);
