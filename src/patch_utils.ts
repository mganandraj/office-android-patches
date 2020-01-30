const {spawn} = require('child_process');

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
    // tslint:disable-next-line:no-console
    console.log(`child process exited with code ${code}`);
  });
}

export function applyPatch(path: string, patch: string) {}
