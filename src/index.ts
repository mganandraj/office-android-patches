const {diffReactNativeForks} = require('./diffReactNativeForks');
const {patchReactNativeFork} = require('./patchReactNativeFork');
const {resolvePath} = require('./fs_utils');

const log = require('simple-node-logger').createSimpleFileLogger(
  'E:\\github\\office-android-patches\\patch-main.log',
);

const basePath = 'E:\\github';

// clean clone of MS fork
const msForkBasePath = resolvePath(basePath, 'ms-react-native-forpatch');

// clean clone of FB repo checked out at the right tag.
const fbRepoBasePath = resolvePath(basePath, 'fb-react-native-forpatch-base');
const fbRepoPatchedPath = resolvePath(
  basePath,
  'fb-react-native-forpatch-patched',
);

const patchesRootPath = resolvePath(
  basePath,
  'office-android-patches\\patches',
);

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
  //'build.gradle', //'CHANGELOG.json', //'CHANGELOG.md', //'cli.js', //'CODE_OF_CONDUCT.md', //'ContainerShip', //'CONTRIBUTING.md',
  'danger',
  'double-conversion',
  //'ECOSYSTEM.md',
  'flow',
  'flow-typed',
  'Folly',
  'follybuild',
  'glog',
  //'gradle', //'gradlew', //'gradlew.bat', //'IntegrationTests',
  'jest',
  'jest-preset.js',
  'jest.config.js',
  'jsc',
  //'KeepingRecent.md',
  'keystores',
  'lib',
  //'Libraries', //'LICENSE', //'LICENSE-docs', //'local-cli',
  'metadata',
  //'metro.config.js',
  'office-android-patches',
  //'package.json',
  'packages',
  //'processor',
  'React',
  //'react-native.config.js', //'react.gradle',
  'React.podspec',
  //'ReactAndroid',
  'ReactApple',
  //'ReactCommon', //'README.md', //'Releases.md', //'rn-get-polyfills.js', //'RNTester',
  'runXcodeTests.sh',
  //'scripts', //'settings.gradle.kts',
  'stubs',
  //'template', //'template.config.js',
  'third-party-podspecs',
  //'tools',
  'v8-docker-build',
  'website',
  'yarn.lock',
];

// diffReactNativeForks(
//   fbRepoBasePath,
//   msForkBasePath,
//   patchesRootPath,
//   topLevelBlackListDirs,
// );

patchReactNativeFork(fbRepoPatchedPath, patchesRootPath);
