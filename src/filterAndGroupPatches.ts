import fse from 'fs-extra';
import path from 'path';
import winston from 'winston';

const logger = winston.createLogger({
  level: 'verbose',
  defaultMeta: {service: 'user-service'},
  format: winston.format.combine(
    winston.format.timestamp(),
    winston.format.json(),
  ),
  transports: [
    new winston.transports.File({
      filename: 'filter_group_error.log',
      level: 'error',
      dirname: 'logs',
    }),
    new winston.transports.File({
      filename: 'filter_group_combined.log',
      dirname: 'logs',
    }),
  ],
});

const rawPatchStore = 'E:\\github\\office-android-patches\\patches';

const filteredGroupedPatchStore =
  'E:\\github\\office-android-patches\\patches-droid-office';

if (fse.existsSync(filteredGroupedPatchStore)) {
  logger.error('Output directory exists !');
  process.exit();
}

fse.ensureDirSync(filteredGroupedPatchStore);

// Known groups
const RNHostDir = 'RNHost';
const V8IntegrationDir = 'V8Integration';
const EditTextFocusDir = 'EditTextFocus';
const AccessibilityDir = 'Accessibility';
const DialogModuleDir = 'DialogModule';
const AnnotationProcessingDir = 'AnnotationProcessing';
const BuildAndThirdPartyFixesDir = 'BuildAndThirdPartyFixes';
const SecurifyFixesDir = 'SecurityFixes';

const processFile = (
  patchFileRelativePath: string,
  groupName: string,
): void => {
  const patchFileName = path.basename(patchFileRelativePath);

  // Source path.
  const patchFileSourceAbsPath = path.resolve(
    rawPatchStore,
    patchFileRelativePath,
  );

  // Create destination path.
  const patchFileRelativeDir = path.parse(patchFileRelativePath).dir;
  const groupDir = path.resolve(filteredGroupedPatchStore, groupName);
  const patchFileAbsDir = path.resolve(groupDir, patchFileRelativeDir);
  fse.ensureDirSync(patchFileAbsDir);
  const patchFileDestAbsPath = path.resolve(patchFileAbsDir, patchFileName);

  fse.copyFileSync(patchFileSourceAbsPath, patchFileDestAbsPath);
};

// Annotation Processing
processFile('settings.gradle.kts', AnnotationProcessingDir);
processFile(
  'processor\\libs\\infer-annotations-1.5.jar',
  AnnotationProcessingDir,
);
