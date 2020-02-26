REM node --inspect %~dp0\..\bundle\bundle.js patch %~dp0\..\.. BuildAndThirdPartyFixes --patch-store %~dp0\..\patches-droid-office-grouped --no-embedded-patcher

node --inspect-brk %~dp0\..\dist\index.js patch %~dp0\..\.. BuildAndThirdPartyFixes --patch-store %~dp0\..\patches-droid-office-grouped --no-embedded-patcher --reverse