# $scaling = 0 : 100% (default)
# $scaling = 1 : 125% 
# $scaling = 2 : 150% 
# $scaling = 3 : 175% 
# screen rescale
param($scaling = 3)
 $source = @'
 [DllImport("user32.dll", EntryPoint = "SystemParametersInfo")]
 public static extern bool SystemParametersInfo(
                  uint uiAction,
                  uint uiParam,
                  uint pvParam,
                  uint fWinIni);
'@
 $apicall = Add-Type -MemberDefinition $source -Name WinAPICall -Namespace SystemParamInfo -PassThru
 $apicall::SystemParametersInfo(0x009F, $scaling, $null, 1) | Out-Null
