import {spawn, spawnSync} from 'child_process';
import {log} from './logger';

import {getArgs} from './cli';
const gitExecutable = getArgs().gitExecutable;

export function cleanRepoSync(path: string) {
  const gitArgs = ['clean', '-fdx'];
  const gitClean = spawnSync(gitExecutable, gitArgs, {cwd: path});
  if (gitClean.error) {
    log.error('cleanRepoSync', `Failed with error : ${gitClean.error}`);
  }
}
