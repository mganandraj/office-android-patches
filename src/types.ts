import program from 'commander';

export interface ICommonOptions extends program.Command {
  gitExecutable: string;
  cleanupRepos: boolean; // Delete all the existing patched. 'gitExecutable' must be specified.
}

export interface IDiffCommandOptions extends ICommonOptions {
  patchName: string; // Name of the folder where the patches will be saved. This folder will be created under the dirty repository.
  diffExecutable: string;
  cleanupExistingPatches: boolean; // Revert all tracked and untracked changes from both repos.
  blacklistDirs: string[]; // These paths will be ignored while recursively traversing the dirty repo.
  blacklistExts: string[];
  whitelistDirs: string[]; // If specified, recursively traversal will start at these directories.
}

export interface IPatchCommandOptions extends ICommonOptions {
  patchExecutable: string;
}

export type PatchRepoFuncType = (
  targetRepoAbsPath: string,
  patchStoreAbsPath: string,
  patchOptions: IPatchCommandOptions,
) => void;
export type DiffReposFuncType = (
  dirtyRepoAbsPath: string,
  baseRepoAbsPath: string,
  diffOptions: IDiffCommandOptions,
) => void;
