import program from 'commander';
import {log} from './logger';
import fse from 'fs-extra';

program.version('0.0.1');

export interface InterfaceCLI extends program.Command {
  debug?: boolean;
  createPatch?: boolean;
  applyPatch?: boolean;
  dirtyFork?: string;
  baseFork?: string;
  targetFork?: string;
  patchFolder?: string;
  patchExecutable?: string;
  diffExecutable?: string;
}

const cli: InterfaceCLI = program
  .option('-d, --debug', 'output extra debugging')
  .option(
    '-p, --create-patch',
    'Create patch files. Specify both dirty fork and base fork',
    false,
  )
  .option(
    '-df, --dirty-fork <path>',
    'Path to dirty fork',
    'E:\\github\\ms-react-native-forpatch',
  )
  .option(
    '-bf, --base-fork <path>',
    'Path to base fork',
    'E:\\github\\fb-react-native-forpatch-base',
  )
  .option(
    '-a, --apply-patch',
    'Apply patch files. Specify both the target fork to apply the patches and the path to path store',
    false,
  )
  .option(
    '-tf, --target-fork <path>',
    'Path to target fork where the patches will be applied',
    'E:\\github\\fb-react-native-forpatch-patched',
  )
  .option(
    '-pf, --patch-folder <path>',
    'Path to patch folder',
    'E:\\github\\office-android-patches\\patches',
  )
  .option(
    '-pe, --patch-executable <path>',
    'Full path of the patch utility to be used for patching. What we expect is a *x patch utility or compatible one: http://man7.org/linux/man-pages/man1/patch.1.html',
    'C:\\Program Files\\Git\\usr\\bin\\patch.exe',
  )
  .option(
    '-de, --diff-executable <path>',
    'Full path of the diff utility to be used for diffing between files. What we expect is a *x diff utility or compatible one: http://man7.org/linux/man-pages/man1/diff.1.html',
    'C:\\Program Files\\Git\\usr\\bin\\diff.exe',
  )
  .on('--help', function() {
    log.info('Main', '-p -df <dirty fork path> -bf <base fork path>');
    log.info('Main', '-a -tf <target fork path> -pf <patch folder>');
    log.info('Main', '-h --help');
  })
  .parse(process.argv);

function logErrorAndExitApp(message: string) {
  log.error('cli', message);
  process.exit(1);
}

if (!cli.applyPatch && !cli.createPatch) {
  logErrorAndExitApp(
    'Either createPath or applyPatch option should be specified when launching the application.',
  );
}

if (cli.applyPatch) {
  if (!cli.targetFork) {
    logErrorAndExitApp('Target fork path is required for applying patch.');
  }
  if (!fse.existsSync(cli.targetFork)) {
    logErrorAndExitApp(
      `Target fork path (${cli.targetFork}) must exist for applying patch.`,
    );
  }
  if (!cli.patchFolder) {
    logErrorAndExitApp('Patch folder is required for applying patch.');
  }
  if (!fse.existsSync(cli.patchFolder)) {
    logErrorAndExitApp(
      `Patch folder (${cli.patchFolder}) must exist for applying patch.`,
    );
  }
  if (!cli.patchExecutable) {
    logErrorAndExitApp('Patch executable path is required for applying patch.');
  }
  if (!fse.existsSync(cli.patchExecutable)) {
    logErrorAndExitApp(
      `Patch executable path (${cli.patchExecutable}) must exist for applying patch.`,
    );
  }
}

if (cli.createPatch) {
  if (!cli.dirtyFork) {
    logErrorAndExitApp('Dirty fork path is required for creating patch.');
  }
  if (!fse.existsSync(cli.dirtyFork)) {
    logErrorAndExitApp(
      `Dirty fork path (${cli.dirtyFork}) must exist for creating patch.`,
    );
  }
  if (!cli.baseFork) {
    logErrorAndExitApp('Base fork path is required for creating patch.');
  }
  if (!fse.existsSync(cli.baseFork)) {
    logErrorAndExitApp(
      `Base fork path (${cli.baseFork}) must exist for creating patch.`,
    );
  }
  if (!cli.diffExecutable) {
    logErrorAndExitApp('Diff executable path is required for creating patch.');
  }
  if (!fse.existsSync(cli.diffExecutable)) {
    logErrorAndExitApp(
      `Diff executable path (${cli.diffExecutable}) must exist for creating patch.`,
    );
  }
}

log.info('Main', `cli.dirtyFork: ${cli.dirtyFork}`);
log.info('Main', `cli.baseFork: ${cli.baseFork}`);
log.info('Main', `cli.targetFork: ${cli.targetFork}`);
log.info('Main', `cli.patchFolder: ${cli.patchFolder}`);
log.info('Main', `cli.applyPatch: ${cli.applyPatch}`);
log.info('Main', `cli.createPatch: ${cli.createPatch}`);
log.info('Main', `cli.patchExecutable: ${cli.patchExecutable}`);
log.info('Main', `cli.diffExecutable: ${cli.diffExecutable}`);

export function getArgs(): InterfaceCLI {
  return cli;
}
