import program from 'commander';
import {log} from './logger';
import fse from 'fs-extra';

import {DiffReposFuncType, PatchRepoFuncType, PatchFileFuncType} from './types';

program.version('0.0.1');

export function initCli(
  diffReposFunc: DiffReposFuncType,
  patchRepoFunc: PatchRepoFuncType,
  patchFileFunc: PatchFileFuncType,
) {
  const defaultWhiteListDirs: string[] = [];

  const defaultBlackListExts = ['.iml'];

  // Places we don't want to look for changes
  const defaultBlackListDirs = [
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
    '.gradle',
    //'gradle', //'gradlew', //'gradlew.bat', //'IntegrationTests',
    '.idea',
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
    'android',
    'node_modules',
    'ReactAndroid\\build',
    'ReactAndroid\\packages',
    'RNTester\\android\\app\\build',
    'processor\\build',
    'local.properties',
  ];

  function commaSeparatedList(value: string, dummyPrevious: any) {
    return value.split(',');
  }

  program
    .command('diff <dirtyRepo> <baseRepo>')
    .description('Diff create ..')
    .option(
      '-pf, --patch-name <path>',
      'Name of the patch folder. This new folder will be created under the dirty repo',
      'patches',
    )
    .option(
      '-de, --diff-executable <path>',
      'Full path of the diff utility to be used for diffing between files. What we expect is a *x diff utility or compatible one: http://man7.org/linux/man-pages/man1/diff.1.html',
      'C:\\Program Files\\Git\\usr\\bin\\diff.exe',
    )
    .option(
      '-ge, --git-executable <path>',
      'Full path of the git executable',
      'C:\\Program Files\\Git\\bin\\git.exe',
    )
    .option(
      '-cc, --cleanup-repos',
      "Whether to clean up both the dirty and base repos. It will cleanup all non-tracked files. Essentially we run 'git clean -fdx'",
      false,
    )
    .option(
      '-cp, --cleanup-existing-patches',
      'Cleanup the existing patches in the patches folder before starting a new diff run',
      true,
    )
    .option(
      '-bl, --blacklist-dirs <paths>',
      'Paths in dirty repo to be excluded from the patch creation and application',
      commaSeparatedList,
      defaultBlackListDirs,
    )
    .option(
      '-be, --blacklist-exts <exts>',
      'File name extensions in dirty repo to be excluded from the patch creation and application',
      commaSeparatedList,
      defaultBlackListExts,
    )
    .option(
      '-wl, --whitelist-dirs <paths>',
      'Paths in dirty repo to be included in the patch creation and application',
      commaSeparatedList,
      defaultWhiteListDirs,
    )
    .action((dirtyRepo: string, baseRepo: string, cmdObject: any) => {
      diffReposFunc(dirtyRepo, baseRepo, cmdObject);
    });

  program
    .command('patch <targetRepo> [patchNames...]')
    .option(
      '-ps, --patch-store <path>',
      'Full path of the directory where the patches can be found. Each patch is a subdirectory in this directory.',
      'E:\\github\\office-android-patches\\patches-droid-office-grouped',
    )
    .option(
      '-ep, --embedded-patcher',
      "If true, use the embedded patching code written in Javascript. Currently, this code is taken from the source code the popular package : 'https://github.com/ds300/patch-package'. And adapted. Thanks !",
      true,
    )
    .option(
      '-pe, --patch-executable <path>',
      'Full path of the patch utility to be used for patching. What we expect is a *x patch utility or compatible one: http://man7.org/linux/man-pages/man1/patch.1.html. Used only if embeddedPatcher is set to false.',
      'C:\\Program Files\\Git\\usr\\bin\\patch.exe',
    )
    .option('-r, --reverse', 'Whether the patch is applied reverse', false)
    .option(
      '-ge, --git-executable <path>',
      'Full path of the git executable',
      'C:\\Program Files\\Git\\bin\\git.exe',
    )
    .option(
      '-cc, --cleanup-repos',
      "Whether to clean up both the dirty and base repos. It will cleanup all non-tracked files. Essentially we run 'git clean -fdx'",
      false,
    )
    .action((targetRepo: string, patchNames: string[], cmdObject: any) => {
      patchRepoFunc(targetRepo, patchNames, cmdObject);
    });

  program
    .command('patchfile <targetFilePath> <patchFilePath>')
    .option(
      '-ep, --embedded-patcher',
      "If true, use the embedded patching code written in Javascript. Currently, this code is taken from the source code the popular package : 'https://github.com/ds300/patch-package'. And adapted. Thanks !",
      true,
    )
    .option(
      '-pe, --patch-executable <path>',
      'Full path of the patch utility to be used for patching. What we expect is a *x patch utility or compatible one: http://man7.org/linux/man-pages/man1/patch.1.html. Used only if embeddedPatcher is set to false.',
      'C:\\Program Files\\Git\\usr\\bin\\patch.exe',
    )
    .option('-r, --reverse', 'Whether the patch is applied reverse', false)
    .action((targetFilePath: string, patchFilePath: string, cmdObject: any) => {
      patchFileFunc(targetFilePath, patchFilePath, cmdObject);
    });

  program.parse(process.argv);
}
