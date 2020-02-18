import winston from 'winston';

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
      dirname: 'logs',
    }),
    new winston.transports.File({
      filename: `combined.log`,
      dirname: `logs\\${Date.now()}`,
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
