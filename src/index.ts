import {diffReactNativeForks} from './diffReactNativeForks';
import {patchReactNativeFork} from './patchReactNativeFork';
import {resolvePath} from './fs_utils';
import {getArgs} from './cli';
import {log} from './logger';

log.info('Main', 'Program starting.');
const args = getArgs();

if (args.createPatch) {
  diffReactNativeForks(
    args.baseFork,
    args.dirtyFork,
    args.patchFolder,
    args.toplevelBlacklistDirs,
  );
} else {
  patchReactNativeFork(args.targetFork, args.patchFolder);
}

log.info('Main', 'Program completed.');
