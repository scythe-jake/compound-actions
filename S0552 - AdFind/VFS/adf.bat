%USERPROFILE%\Desktop\adfind\adfind.exe -f "(objectcategory=person)" > %USERPROFILE%\Desktop\adfind\ad_users.txt
%USERPROFILE%\Desktop\adfind\adfind.exe -f "objectcategory=computer" > %USERPROFILE%\Desktop\adfind\ad_computers.txt
%USERPROFILE%\Desktop\adfind\adfind.exe -sc trustdmp > %USERPROFILE%\Desktop\adfind\trustdmp.txt
%USERPROFILE%\Desktop\adfind\adfind.exe -subnets -f (objectCategory=subnet)> %USERPROFILE%\Desktop\adfind\subnets.txt
%USERPROFILE%\Desktop\adfind\adfind.exe -gcb -sc trustdmp > %USERPROFILE%\Desktop\adfind\trustdmp.txt
%USERPROFILE%\Desktop\adfind\adfind.exe -sc domainlist > %USERPROFILE%\Desktop\adfind\domainlist.txt
%USERPROFILE%\Desktop\adfind\adfind.exe -sc dcmodes > %USERPROFILE%\Desktop\adfind\dcmodes.txt
%USERPROFILE%\Desktop\adfind\adfind.exe -sc adinfo > %USERPROFILE%\Desktop\adfind\adinfo.txt
%USERPROFILE%\Desktop\adfind\adfind.exe -sc dclist > %USERPROFILE%\Desktop\adfind\dclist.txt
%USERPROFILE%\Desktop\adfind\adfind.exe -sc computers_pwdnotreqd > %USERPROFILE%\Desktop\adfind\computer_pwdnotereqd.txt
