import {diffReactNativeForks} from './diffReactNativeForks';
import {patchReactNativeFork} from './patchReactNativeFork';
import {resolvePath} from './fs_utils';
import {InterfaceCLI, getArgs} from './cli';
import {log} from './logger';

log.info('Main', 'Program starting.');
const args = getArgs();

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

if (args.createPatch) {
  diffReactNativeForks(
    args.baseFork,
    args.dirtyFork,
    args.patchFolder,
    topLevelBlackListDirs,
  );
} else {
  patchReactNativeFork(args.targetFork, args.patchFolder);
}
