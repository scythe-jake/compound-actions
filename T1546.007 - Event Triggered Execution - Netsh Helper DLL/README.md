# Execution with SCYTHE - T1546.007
Note: This is for Windows campaigns and requires administrator privileges for execution
1. Create a SCYTHE campaign that you wish to execute
2. After campaign creation click the Download button and select DLL payload
3. Change the entry point function name to `InitHelperDll`
4. Click 'Download Windows SCYTHE Client'
5. Position DLL payload on system under test
6. Run `netsh.exe add helper <path to DLL>`

The result will be execution of the DLL payload, and persistence within the Windows Registry for anytime netsh.exe is called by any program. Netsh.exe is not called upon Windows Start up, so a scheduled task or another method will need to be used to prompt netsh.exe being called if no other programs do.

## Clean Up Steps
Since this technique leaves a persistence method, clean up is necessary.

Keys are made for the DLL in: HKLM\SOFTWARE\Microsoft\Netsh

`Remove-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\NetSh\ -Name <DLL Name without the DLL extension>`

## SIGMA Detection
https://github.com/SigmaHQ/sigma/blob/0a410010a2655bc6f2aae73b9fb3b2c00ed589f7/rules/windows/process_creation/win_susp_netsh_dll_persistence.yml

## References
https://attack.mitre.org/techniques/T1546/007/
https://lolbas-project.github.io/lolbas/Binaries/Netsh/ 