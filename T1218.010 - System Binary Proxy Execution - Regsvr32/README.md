# Execution with SCYTHE
Note: This is for Windows specific campaigns
1. Create a SCYTHE campaign that you wish to execute
2. After campaign creation click the Download button and select DLL payload
3. Change the entry point function name to 'DllRegisterServer'
4. Click 'Download Windows SCYTHE Client'
5. Position DLL payload on system under test
6. Run `regsvr32.exe <DLL name>.dll`

Credit to @bradosev-scythe for finding this

Reference: https://lolbas-project.github.io/lolbas/Binaries/Regsvcs/