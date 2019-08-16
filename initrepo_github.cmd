@echo off
if exist .git\config goto CONFIG
echo Current directory doesn't contain git repository
pause
goto EOF

:CONFIG
echo on
git config user.name amfipterus
git config user.email 29779155+amfipterus@users.noreply.github.com
git config user.signingkey C39B7A92C6776A31
git config commit.gpgsign true
pause