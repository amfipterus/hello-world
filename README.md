# hello-world
hello-world

Another one of 100500 hello-worlds

Local change in the cloned repo.

gpg.exe in %programfiles%\git directory use homedir different from %programfiles%\gnupg
gnu\gnupg homedir - %appdata%\gnupg
git\gnupg homedir - %userprofile%\.gnupg

Continue investigate:

vs2019\git - doesn't include and support? commit signing

vscode\git - works well
	vscode\git uses system git installation. So if git\gnupg is configured and works, so does vscode.

now trying to fool vs2019... done well
	vs2019 uses cropped version of 32-bit git.exe, located in:
	<vs2019_install_dir>\Common7\IDE\CommonExtensions\Microsoft\TeamFoundation\Team Explorer\GIT\mingw32
	There's git installed in system, but it's 64-bit, so it doesn't contain mingws32, but mingw64
	So, to fool vs2019 the following steps are made:
	1. Junction point %programfiles%\git\mingw64 --> %programfiles%\git\mingw32
	2. Rename/delete vs2019\git
	3. Junction point %programfiles%\git --> <vs2019_install_dir>\...\GIT

now about gnupg\gpg & git\gpg homedir conflict:
	1. Create junction point %appdata%\gnupg --> %userprofile%\.gnupg
	But sometimes git\gpg raise error on <somefile>.lock wrong size.
	After deleting mentioned file works well. 
	Maybe it's possible to force git to use system gpg installation... Rename git\gpg.exe for example.
	System git is on PATH environment variable... Will try...