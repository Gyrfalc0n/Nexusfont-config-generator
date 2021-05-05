Rem Your destination directory for library.xml file
set output_path =C:\Users\Enguerrand\Desktop
pushd %output_path%
IF EXIST "library.xml" (
    del library.xml
)
Rem "Your python3 path" "python generator file"
"E:\Users\Enguerrand\AppData\Local\Programs\Python\Python38-32\python.exe" "nexusfont.py"
popd
Rem IF BASIC NEXUSFONT INSTALL
Rem xcopy /s /y library.xml C:\Users\%USERNAME%\AppData\Roaming\nexusfont\
Rem IF PORTABLE NEXUSFONT INSTALL
xcopy /s /y library.xml path_to_nexusfont\userdata
pause
