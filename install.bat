@echo off
setlocal enabledelayedexpansion
@title NvimConfigurer

set WINDOWS_NVIM_PATH=%LOCALAPPDATA%\\nvim


goto entryPoint

:entryPoint
goto validateNDownloadNodeJs



:installVimPlugMsg
echo Notice: If vim-plug is not installed, then paste the
echo following command in powershell and install it,otherwise
echo continue.
echo  Command: 
echo iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim ^|`
echo    ni $HOME/vimfiles/autoload/plug.vim -Force
pause
goto copyConfigs
:validateNDownloadNodeJs
where node > nul 2> nul
if %errorlevel% == 0 (
color 0a
echo NodeJs: OK
) else (
color 0c
echo NodeJs: Not Installed
echo Installing nodejs...
cinst nodejs > nul 2> nul 
if !errorlevel! == 0 (
color 0a
echo NodeJs installed successfully!,you need to restart the shell to take effect.
goto eof
) else (
echo An Error occured while installing NodeJs.exiting..
goto eof
)
)
goto installVimPlugMsg

:downloadConfigs
set /A index=0
set "files=https://github.com/Justaus3r/init.vim/raw/Master/init.vim https://github.com/Justaus3r/init.vim/raw/Master/configs/commands.vim https://github.com/Justaus3r/init.vim/raw/Master/configs/mappings.vim https://github.com/Justaus3r/init.vim/raw/Master/configs/plugins.vim https://github.com/Justaus3r/init.vim/raw/Master/configs/settings.vim https://github.com/Justaus3r/init.vim/raw/Master/configs/shell.vim"
set "filename[0]=init.vim" 
set "filename[1]=commands.vim" 
set "filename[2]=mappings.vim" 
set "filename[3]=plugins.vim" 
set "filename[4]=settings.vim"
set "filename[5]=shell.vim"
for %%a in (%files%) do (
FOR /F "tokens=*" %%g IN ('call echo %%filename[!index!]%%') do (SET filename=%%g)
powershell "(Invoke-WebRequest -Uri %%a -UseBasicParsing -Method "GET").Content >'%USERPROFILE%\\!filename!'"
set /A "index+=1"
)
if %errorlevel% == 0 (
color 0a
echo Files Downloaded Successfully!
goto actualYanking
) else (
echo Config download Failed!
goto eof
)
:copyConfigs
if not exist %WINDOWS_NVIM_PATH% (
  color 0c
  echo Nvim config not found!,Downloading and copying...
  goto downloadConfigs
  :actualYanking
  mkdir %WINDOWS_NVIM_PATH%
  copy "%USERPROFILE%\\init.vim" %WINDOWS_NVIM_PATH%
  mkdir "%WINDOWS_NVIM_PATH%\\configs"
  for %%I in ("%USERPROFILE%\\commands.vim" "%USERPROFILE%\\mappings.vim" "%USERPROFILE%\\plugins.vim" "%USERPROFILE%\\settings.vim" "%USERPROFILE%\\shell.vim") do copy %%I "%WINDOWS_NVIM_PATH%\\configs"
  if %errorlevel% == 0 (
  echo Configs copied successfully
  goto eof
  ) else (
  echo Copying Failed!
  goto eof
 )
) else (
  echo Config Directory already exists!,Skipping configuration...
)
echo Done!


:eof
color
