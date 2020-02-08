import fse from 'fs-extra';
import crypto from 'crypto';

import {log} from './logger';

export function compareFiles(
  path1: string,
  path2: string,
  callback: (result: boolean) => void,
  callbackOnError: (result: string) => void,
) {
  try {
    let hash = crypto.createHash('md5');
    let stream1 = fse.createReadStream(path1);

    stream1.on('data', function(data) {
      hash.update(data, 'utf8');
    });

    stream1.on('end', function() {
      hash.digest('hex');

      let hash2 = crypto.createHash('md5');
      let stream2 = fse.createReadStream(path2);

      stream2.on('data', function(data) {
        hash2.update(data, 'utf8');
      });

      stream2.on('end', function() {
        hash2.digest('hex');

        if (hash === hash2) {
          log.info(
            'compareFiles',
            `${path1} AND ${path2} are identical.  hashes: ${hash} === ${hash2}`,
          );
          callback(true);
        } else {
          log.info(
            'compareFiles',
            `${path1} AND ${path2} are different. hashes: ${hash} === ${hash2}`,
          );
          callback(false);
        }
      });
    });
  } catch (e) {
    callbackOnError(`${e}`);
  }
}
