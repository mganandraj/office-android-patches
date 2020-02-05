import fs from 'fs';
import fse from 'fs-extra';
import fs_path from 'path';
import {pathToFileURL} from 'url';
import {log} from './logger';

export function resolvePath(base: string, relative: string): string {
  return fs_path.resolve(base, relative);
}

export function isDirectory(path: string) {
  try {
    return fs.lstatSync(path).isDirectory();
  } catch (e) {
    // tslint:disable-next-line:no-console
    console.log('throw::isDirectory::' + path + '::' + e);
  }
}

export function isRegularFile(path: string) {
  try {
    return fs.lstatSync(path).isFile();
  } catch (e) {
    // tslint:disable-next-line:no-console
    console.log('throw::isRegularFile::' + path + '::' + e);
  }
}

export function isSymlink(path: string) {
  try {
    return fs.lstatSync(path).isSymbolicLink();
  } catch (e) {
    // tslint:disable-next-line:no-console
    console.log('throw::isSymlink::' + path + '::' + e);
  }
}

export function getRelativePath(absPath: string, base: string) {
  return fs_path.relative(base, absPath);
}

//
export function writeFile(
  basepath: string,
  relativefilepath: string,
  data: string,
) {
  try {
    // const name2 = 'patch-' + name.replace(/[ &\/\\#,+()$~%.'":*?<>{}]/g, '-');
    const name = fs_path.basename(relativefilepath);
    const relative_dir = fs_path.parse(relativefilepath).dir;

    // Create directory if not exists.
    const absPath1 = fs_path.resolve(basepath, relative_dir);
    if (!fs.existsSync(absPath1)) {
      fse.ensureDirSync(absPath1);
    }

    const absPath2 = fs_path.resolve(absPath1, name);

    fs.writeFileSync(absPath2, data);
  } catch (e) {
    throw new Error(
      'File Writing Failed::' + basepath + '::' + relativefilepath + '::' + e,
    );
  }
}

// Note :: Assuming the input path is an absolute path.
// And callback gets called with absolute path
export function traverseDirectory(
  path: string,
  callbackFile: (path: string) => void,
  callbackDirectory: (path: string) => void,
  topLevelBlackListDirs: string[] = [],
  recursive: boolean = true,
) {
  if (isRegularFile(path)) {
    callbackFile(path);
  } else if (isDirectory(path)) {
    const children = fs.readdirSync(path);
    children.forEach((childpath: string) => {
      if (topLevelBlackListDirs.includes(childpath)) return;
      const absChildPath = fs_path.resolve(path, childpath);
      callbackDirectory(absChildPath);
      if (recursive)
        traverseDirectory(
          absChildPath,
          callbackFile,
          callbackDirectory,
          [],
          recursive,
        );
    });
  } else if (isSymlink(path)) {
    throw new Error('We currently dont support symlinks: ' + path);
  }
}

// Note :: Lookup a relative path in a give root path
export function lookUpRelativePath(
  path: string,
  relativePath: string,
  callbackOnHit: (path: string) => void,
  callbackOnMiss: (path: string) => void,
) {
  const absChildPath = fs_path.resolve(path, relativePath);
  if (!fs.existsSync(absChildPath)) {
    callbackOnMiss(absChildPath);
  } else {
    callbackOnHit(absChildPath);
  }
}

export function initDirectory(path: string) {
  fse.removeSync(path);
  if (fse.existsSync(path)) {
    throw new Error("Output directory can't be nuked !! (" + path + ')');
  }
  fse.ensureDirSync(path);
}
