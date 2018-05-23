Function New-FolderStructure{
    Param(
        [String]$Path
    )

    if(!(test-Path $Path)){
        $NewPath = Split-Path -Path $Path -Parent
        write-verbose "$NewPath is not present"
        New-FolderStructure -Path $NewPath
        if(!(Test-Path $NewPath)){
            write-verbose "Creating $NewPath"
            try{
                New-Item -Path $NewPath -ErrorAction Stop
            }Catch{
                write-warning $_
            }
        }
        
    }

}
