const {spawn} = require('child_process');

const log = require('simple-node-logger').createSimpleFileLogger(
  'E:\\github\\office-android-patches\\patch-exec.log',
);

// Returns patch between files as string
// Return empty string when files are identical
export function createPatch(
  path1: string,
  path2: string,
  callback: (diff: string) => void,
) {
  const patch = spawn('git', ['diff', path1, path2]);

  patch.stdout.on('data', (data: string) => {
    callback(data);
  });

  patch.stderr.on('data', (data: any) => {
    throw new Error('git diff failed between ' + path1 + ' and ' + path2);
    callback('');
  });

  patch.on('close', (code: any) => {
    log.info(`git child process exited with code ${code}`);
  });
}

export function applyPatch(
  targetPath: string,
  patchPath: string,
  callback: (result: string) => void,
) {
  const patchArgs = ['-i', patchPath, targetPath, '-s'];
  const patch = spawn('C:\\Program Files\\Git\\usr\\bin\\patch.exe', patchArgs);
  log.info(
    'Calling C:\\Program Files\\Git\\usr\\bin\\patch.exe ' +
      patchArgs.toString(),
  );

  patch.on('message', (message: string) => {
    callback(`Patch message: ${message}`);
  });

  patch.stdout.on('data', (data: string) => {
    callback(`Patch output: ${data}`);
  });

  patch.stderr.on('data', (data: any) => {
    throw new Error('patch failed on ' + targetPath + ' with ' + patchPath);
    callback('');
  });

  patch.on('close', (code: any) => {
    log.info(`patch child process exited with code ${code}`);
  });
}
