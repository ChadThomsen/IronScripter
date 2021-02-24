<#
Your goal is to find the values in $List that do not match anything in $Target.
Your code will be successful if you get foo and bar for results.
https://ironscripter.us/let-the-powershell-challenges-begin/

CMT 23-FEB-2021
#>

$targets = "Spooler", "Spork Client", "WinRM", "Spork Agent Service", "BITS","WSearch"
$lists = "winrm", "foo", "spooler", "spor*", "bar"
$answer = @()

foreach ($list in $lists) {
    foreach ($target in $targets){
        #check for match and break out of current iteration if there is a match.
        if ($list -like $target -or $target -like $list ){
            break
        }
        #make sure you are at end of current targets array, and if so add current element to answer array
        if(($targets.IndexOf($target)) -eq ($targets.count-1)){
            $answer = $answer + $list
        }
    }
}
write-host $answer

<#
Best answer given:  
$list | Where-Object {(-Not($target -like $_))}
#>