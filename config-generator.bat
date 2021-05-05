@echo off
Rem Your destination directory for library.xml file
set output_path =<your output path here>
Rem Your python3 path
set python_path =C:\Program Files (x86)\Microsoft Visual Studio\Shared\Python37_64\python.exe
pushd %output_path%
IF EXIST "library.xml" (
    del library.xml
)
%python_path% "nexusfont-generator.py"
popd
xcopy /s /y %output_path%\library.xml C:\Users\%USERNAME%\AppData\Roaming\nexusfont\
