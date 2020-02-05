import program from 'commander';
import {log} from './logger';

program.version('0.0.1');

export interface InterfaceCLI extends program.Command {
  debug?: boolean;
  createPatch?: boolean;
  applyPatch?: boolean;
  dirtyFork?: string;
  baseFork?: string;
  targetFork?: string;
  patchFolder?: string;
}

const cli: InterfaceCLI = program
  .option('-d, --debug', 'output extra debugging')
  .option(
    '-p, --create-patch',
    'Create patch files. Specify both dirty fork and base fork',
    true,
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
    '-a, --apply-patch',
    'Apply patch files. Specify both the target fork to apply the patches and the path to path store',
    false,
  )
  .on('--help', function() {
    log.info('Main', '-p -df <dirty fork path> -bf <base fork path>');
    log.info('Main', '-a -tf <target fork path>');
    log.info('Main', '-h --help');
  })
  .parse(process.argv);

log.info('Main', `cli.dirtyFork: ${cli.dirtyFork}`);
log.info('Main', `cli.baseFork: ${cli.baseFork}`);
log.info('Main', `cli.targetFork: ${cli.targetFork}`);
log.info('Main', `cli.patchFolder: ${cli.patchFolder}`);
log.info('Main', `cli.applyPatch: ${cli.applyPatch}`);
log.info('Main', `cli.createPatch: ${cli.createPatch}`);

export function getArgs(): InterfaceCLI {
  return cli;
}
