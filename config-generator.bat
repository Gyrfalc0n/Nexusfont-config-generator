Rem Your destination directory for library.xml file
set output_path =your_path
pushd %output_path%
IF EXIST "library.xml" (
    del library.xml
)
Rem "Your python3 path" "python generator file"
"path_to_python_exe" "nexusfont-generator.py"
popd
Rem IF BASIC NEXUSFONT INSTALL
Rem xcopy /s /y library.xml C:\Users\%USERNAME%\AppData\Roaming\nexusfont\
Rem IF PORTABLE NEXUSFONT INSTALL
xcopy /s /y library.xml path_to_nexusfont\userdata
