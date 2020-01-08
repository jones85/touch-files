 <#
    .SYNOPSIS
        This function collects a list of files within a directory and child directories, then amends the last write time to the time of execution
    .EXAMPLE
        PS> touch-files -FilePath 'C:\My files' -Recurse True

        This example will collect all files from the directory C:\My Files and child directories and amend the last write attribute to the current date/time
    .PARAMATER FileLocation
        This determines the parent location of the files to be amended.
    .PARAMATER FileLocation
        This determines if all files in child directories are amended.         
    #>
    [CmdletBinding(SupportsShouldProcess=$true)]
    param(
        [Parameter(position=0,mandatory=$true)]
        [string]$FilePath,
        [Parameter(position=1)]
        [ValidateSet($True,$False)]
        [string]$Recurse = $false
    )
    process {
        try {
            
            [System.Convert]::ToBoolean($Recurse)

            if($Recurse -eq $true){
                $FilesToTouch = Get-ChildItem -Path $FilePath -Recurse | where { ! $_.PSIsContainer }
            }
            Else{
                $FilesToTouch = Get-ChildItem -Path $FilePath | where { ! $_.PSIsContainer }
            }

            if(!($FilesToTouch -eq $null)){
                foreach ($File in $FilesToTouch){
                    $File.lastWriteTime = (Get-Date)
                }    
            }
            Else{
                Write-Host 'No files found'
            }
            Get-ChildItem -Path $FilePath -Recurse | where { ! $_.PSIsContainer }
           
            } catch {
                Write-Error "$($_.Exception.Message) -Line Number: $($_.InvocationInfo.ScriptLineNumber)"
            }
        }
    }
# EOF
