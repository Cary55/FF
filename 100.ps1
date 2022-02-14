param($scaling = 0)
 $source = @'
 [DllImport("user32.dll", EntryPoint = "SystemParametersInfo")]
 public static extern bool SystemParametersInfo(
                  uint uiAction,
                  uint uiParam,
                  uint pvParam,
                  uint fWinIni);
'@
 $apicall = Add-Type -MemberDefinition $source -Name WinAPICall -Namespace SystemParamInfo -PassThru
 $apicall::SystemParametersInfo(0x009F, $scaling, $null, 0) | Out-Null
