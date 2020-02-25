import diffRepos from './diffRepos';
import patchRepo from './patchRepo';
import patchFile from './patchFile';
import {initCli} from './cli';

initCli(diffRepos, patchRepo, patchFile);
