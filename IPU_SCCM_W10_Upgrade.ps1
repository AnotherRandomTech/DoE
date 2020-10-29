### Below gets all the programs in the SCCM Software Centre "Operating Systems" GUI
# get-wmiobject -query "SELECT * FROM CCM_Program" -namespace "ROOT\ccm\ClientSDK" | Out-GridView

## Installs Windows 10 Education [1909] using in place upgrade method.
$IPUTask = (get-wmiobject -query "SELECT * FROM CCM_Program" -namespace "ROOT\ccm\ClientSDK") | Where-Object { $_.FullName -like "*IPU: Windows 10 Education*" }

## ReturnValue should be 0 if it has started the upgrade sequence.
Invoke-WmiMethod -Class CCM_ProgramsManager -Namespace "root\ccm\clientsdk" -Name ExecutePrograms -argumentlist $IPUTask