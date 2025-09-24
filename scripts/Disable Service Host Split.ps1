Get-ChildItem 'HKLM:\SYSTEM\CurrentControlSet\Services' |
        Where-Object { $_.Name -notmatch 'Xbl|Xbox' } |
        Foreach-Object {
          if ($null -ne (Get-ItemProperty -Path """Registry::$_""" -EA 0).Start) {
            Set-ItemProperty -Path """Registry::$_""" -Name 'SvcHostSplitDisable' -Type DWORD -Value 1 -Force -EA 0
          }
        }