$date=(get-date).AddMonths(-2)
$profiles=Get-ChildItem /Users | where {$_.LastWriteTime -lt $date}
$exclude=@(
    'admin'
    'Shared'
    'tech'
    '.localized'
)
foreach($profile in $profiles){
if ($exclude -contains $profile.Name){
    echo "Not deleting"
    }else{
    echo $profile
    rm -rf $profile.FullName
}
}



$users=ls /Users
Foreach ($user in $users){

    If (Test-path -path "/Users/$user/Library/Caches/Adobe/After Effects"){
	    $aefts=ls /Users/$user/Library/Caches/Adobe/After` Effects/
	    if ($aefts.count -gt 1){
		    $max=($aefts | Measure-Object -Maximum).Maximum
		    foreach ($aeft in $aefts){
			    if ($aeft -ne $max){
				rm -rf /Users/$user/Library/Caches/Adobe/After` Effects/$aeft
			    }   
		    } 
        }
    }


    If (Test-path -path "/Users/$user/Library/Caches/Adobe/Premiere Pro"){
	    $ppros=ls /Users/$user/Library/Caches/Adobe/Premiere` Pro/
	    if ($ppros.count -gt 1){
		    $max=($ppros | Measure-Object -Maximum).Maximum
		    foreach ($ppro in $ppros){
			    if ($ppro -ne $max){
				rm -rf /Users/$user/Library/Caches/Adobe/Premiere` Pro/$ppro
			    }   
		    } 
        }
    }


}

touch /Users/Shared/.com.github.munkireport.run

