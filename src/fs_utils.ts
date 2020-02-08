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
    log.error('FS:isDirectory', `${path}::${e}`);
  }
}

export function isRegularFile(path: string) {
  try {
    return fs.lstatSync(path).isFile();
  } catch (e) {
    log.error('FS:isRegularFile', `${path}::${e}`);
  }
}

export function isSymlink(path: string) {
  try {
    return fs.lstatSync(path).isSymbolicLink();
  } catch (e) {
    log.error('FS:isSymlink', `${path}::${e}`);
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
  extension?: string /* Optional extension to be added to the relativefilepath */,
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

    const absPath2 = fs_path.resolve(
      absPath1,
      extension ? `${name}.${extension}` : name,
    );

    fs.writeFileSync(absPath2, data);
  } catch (e) {
    log.error(
      'FS:writeFile',
      `File Writing Failed::${basepath}::${relativefilepath}::${e}`,
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
    log.error(
      'FS:traverseDirectory',
      `We currently dont support symlinks: ${path}`,
    );
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
    log.error(
      'FS:initDirectory',
      `Output directory can't be nuked !! (${path})`,
    );
  }
  fse.ensureDirSync(path);
}

export function copyFile(absSourecPath: string, absDestinationPath: string) {
  fse.copyFileSync(absSourecPath, absDestinationPath);
}

export function copyFile2(
  destBasepath: string,
  destRelativefilepath: string,
  sourcePath: string,
) {
  // Ensure the directory exists.
  const destRelativeDir = fs_path.parse(destRelativefilepath).dir;

  // Create directory if not exists.
  const destAbsDir = fs_path.resolve(destBasepath, destRelativeDir);
  if (!fs.existsSync(destAbsDir)) {
    fse.ensureDirSync(destAbsDir);
  }

  const destAbsPath = fs_path.resolve(destBasepath, destRelativefilepath);
  if (fs.existsSync(destAbsDir)) {
    log.error(
      'FS:copyFile2',
      `Trying to copy binary file but it already exists (${sourcePath})!`,
    );
  }

  fse.copyFileSync(sourcePath, destAbsPath);
}
