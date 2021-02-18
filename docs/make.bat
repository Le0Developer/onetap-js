@ECHO OFF

pushd %~dp0

REM Command file for Sphinx documentation

if "%SPHINXBUILD%" == "" (
	set SPHINXBUILD=sphinx-build
)
set SOURCEDIR=.
set BUILDDIR=_build

if "%1" == "" goto help

%SPHINXBUILD% >NUL 2>NUL
if errorlevel 9009 (
	echo.
	echo.The 'sphinx-build' command was not found. Make sure you have Sphinx
	echo.installed, then set the SPHINXBUILD environment variable to point
	echo.to the full path of the 'sphinx-build' executable. Alternatively you
	echo.may add the Sphinx directory to PATH.
	echo.
	echo.If you don't have Sphinx installed, grab it from
	echo.http://sphinx-doc.org/
	exit /b 1
)

%SPHINXBUILD% -M %1 "main" "_build/main" %SPHINXOPTS% %O%
%SPHINXBUILD% -M %1 "v3" "_build/v3" %SPHINXOPTS% %O%
%SPHINXBUILD% -M %1 "v3rerun" "_build/v3rerun" %SPHINXOPTS% %O%
xcopy _build/v3/html/v3/ _build/main/html/v3/ /E
xcopy _build/v3rerun/html/v3rerun/ _build/main/html/v3rerun/ /E
goto end

:help
%SPHINXBUILD% -M help %SOURCEDIR% %BUILDDIR% %SPHINXOPTS% %O%

:end
popd
