
##no print log： v3.0

#disk print：
Get-Date
(Get-Date).ToString() 
Get-WMIObject Win32_LogicalDisk | Select-Object DeviceID, 
@{Name="Size(GB)";Expression={"{0:N2}" -f ($_.Size / 1GB)}}, 
@{Name="FreeSpace(GB)";Expression={"{0:N2}" -f ($_.Freespace / 1GB)}},
@{Name="FreeSpace(%)";Expression={"{0:N2}" -f (($_.FreeSpace/$_.Size)*100)}} | 
Format-Table -AutoSize

#users filesize print：
$output = gci -force 'C:\'-ErrorAction SilentlyContinue | ? { $_ -is [io.directoryinfo] } | % {
    $len = 0
    gci -recurse -force $_.fullname -ErrorAction SilentlyContinue | % { $len += $_.length }
    [PsCustomObject]@{
        "Folder" = $_.fullname
        "Size(GB)" = '{0:N2}' -f ($len / 1GB)
    }
}

$output | Format-Table -AutoSize