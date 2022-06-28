# Execution with SCYTHE
Note: This is for Windows specific campaigns
1. Create a SCYTHE campaign that you wish to execute
2. After campaign creation click the Download button and select DLL payload
3. Change the entry point function name to `DllRegisterServer`
4. Click 'Download Windows SCYTHE Client'
5. Position DLL payload on system under test
6. Run `regsvr32.exe <DLL name>.dll`

Credit to @bradosev-scythe for finding this

## SIGMA Detection
https://github.com/SigmaHQ/sigma/blob/c9007cb3ed8f8cc3ba949427d0b0bfa67cf45f34/rules/windows/network_connection/net_connection_win_regsvr32_network_activity.yml

Reference: https://lolbas-project.github.io/lolbas/Binaries/Regsvcs/
