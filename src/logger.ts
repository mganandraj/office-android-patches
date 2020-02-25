import winston from 'winston';
import fs_path from 'path'; // TODO

// Suitable for developments.. may not be when running in the CI/Publish machines.
const getLogDirectoryDev = () => {
  const loggerSourcePath = __dirname;

  // // tslint:disable-next-line:no-console
  // console.log(`loggerSourcePath: ${loggerSourcePath}`);

  const loggerParentDir = fs_path.resolve(loggerSourcePath, '..');

  // // tslint:disable-next-line:no-console
  // console.log(`loggerParentDir: ${loggerParentDir}`);

  const logDirBase = fs_path.resolve(loggerParentDir, 'logs');
  return fs_path.resolve(logDirBase, `${Date.now()}`);
};

const logDirectory = getLogDirectoryDev();

// // tslint:disable-next-line:no-console
// console.log(`logDirectory: ${logDirectory}`);

const logger = winston.createLogger({
  level: 'verbose',
  defaultMeta: {service: 'user-service'},
  format: winston.format.combine(
    winston.format.timestamp(),
    winston.format.json(),
  ),
  transports: [
    //
    // - Write all logs with level `error` and below to `error.log`
    // - Write all logs with level `info` and below to `combined.log`
    //
    new winston.transports.File({
      filename: 'error.log',
      level: 'error',
      dirname: logDirectory,
    }),
    new winston.transports.File({
      filename: `combined.log`,
      dirname: logDirectory,
    }),
  ],
});

function info(prefix: string, message: string) {
  logger.info(`${prefix} - ${message}`);
}

function verbose(prefix: string, message: string) {
  logger.verbose(`${prefix} - ${message}`);
}

function error(prefix: string, message: string) {
  logger.error(`${prefix} - ${message}`);
}

const log = {error, info, verbose};
export {log};
