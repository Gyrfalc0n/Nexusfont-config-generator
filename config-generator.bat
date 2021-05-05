@echo off
set output_path =<your output path here>
set python_path =C:\Program Files (x86)\Microsoft Visual Studio\Shared\Python37_64\python.exe
pushd %output_path%
IF EXIST "library.xml" (
    del library.xml
)
%python_path% "nexusfont-generator.py"
popd
xcopy /s /y %output_path%\library.xml C:\Users\%USERNAME%\AppData\Roaming\nexusfont\
