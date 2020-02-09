import {diffReactNativeForks} from './diffReactNativeForks';
import {patchReactNativeFork} from './patchReactNativeFork';
import {resolvePath, initDirectory} from './fs_utils';
import {cleanRepoSync} from './git_utils';
import {getArgs} from './cli';
import {log} from './logger';

log.info('Main', 'Program starting.');
const args = getArgs();

if (args.createPatch) {
  if (args.cleanupForks) {
    cleanRepoSync(args.baseFork);
    cleanRepoSync(args.dirtyFork);
  }

  if (args.cleanupExistingPatches) {
    initDirectory(args.patchFolder);
  }

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
