adfind.exe -f "(objectcategory=person)" > %USERPROFILE%\Desktop\adfind\ad_users.txt
adfind.exe -f "objectcategory=computer" > %USERPROFILE%\Desktop\adfind\ad_computers.txt
adfind.exe -sc trustdmp > %USERPROFILE%\Desktop\adfind\trustdmp.txt
adfind.exe -subnets -f (objectCategory=subnet)> %USERPROFILE%\Desktop\adfind\subnets.txt
adfind.exe -gcb -sc trustdmp > %USERPROFILE%\Desktop\adfind\trustdmp.txt
adfind.exe -sc domainlist > %USERPROFILE%\Desktop\adfind\domainlist.txt
adfind.exe -sc dcmodes > %USERPROFILE%\Desktop\adfind\dcmodes.txt
adfind.exe -sc adinfo > %USERPROFILE%\Desktop\adfind\adinfo.txt
adfind.exe -sc dclist > %USERPROFILE%\Desktop\adfind\dclist.txt
adfind.exe -sc computers_pwdnotreqd > %USERPROFILE%\Desktop\adfind\computer_pwdnotereqd.txt