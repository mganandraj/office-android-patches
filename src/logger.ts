import winston from 'winston';
import fs_path from 'path'; // TODO

// Suitable for developments.. may not be when running in the CI/Publish machines.
const getLogDirectoryDev = () => {
  const loggerSourcePath = __dirname;
  const loggerParentDir = fs_path.resolve(loggerSourcePath, '..');
  const logDirBase = fs_path.resolve(loggerParentDir, 'logs');
  return fs_path.resolve(logDirBase, `${Date.now()}`);
};

const logDirectory = getLogDirectoryDev();

const logger = winston.createLogger({
  level: 'verbose',
  defaultMeta: {service: 'user-service'},
  format: winston.format.combine(
    winston.format.timestamp(),
    winston.format.json(),
  ),
});

function setLogFolder(logFolder: string) {
  // logFolder = fs_path.resolve(logFolder, `${Date.now()}`);

  logger.add(
    new winston.transports.File({
      filename: 'error.log',
      level: 'error',
      dirname: logFolder,
    }),
  );
  logger.add(
    new winston.transports.File({
      filename: `all.log`,
      dirname: logFolder,
    }),
  );
}

function info(prefix: string, message: string) {
  logger.info(`${prefix} - ${message}`);
}

function verbose(prefix: string, message: string) {
  logger.verbose(`${prefix} - ${message}`);
}

function error(prefix: string, message: string) {
  logger.error(`${prefix} - ${message}`);
}

function warn(prefix: string, message: string) {
  logger.warn(`${prefix} - ${message}`);
}

const log = {setLogFolder, error, warn, info, verbose};
export {log};
