New-Alias -Name init -Value gitinit

function gitinit() {
	$arg1 = "ginit"
	Start-Process git -ArgumentList $arg1 -Wait -NoNewWindow
}

New-Alias -Name fetch -Value gitfetch

function gitfetch() {
    $arg1 = "fetch"
    Start-Process git -ArgumentList $arg1 -Wait -NoNewWindow
}

New-Alias -Name merge -Value gitmerge

function gitmerge(){
    $arg1 = "merge"
    Start-Process git -ArgumentList $arg1 -Wait -NoNewWindow
}

New-Alias -Name push -Value gitpush

function gitpush(){
    $arg1 = "push"
    Start-Process git -ArgumentList $arg1 -Wait -NoNewWindow
}

New-Alias -Name pull -Value gitpull

function gitpull(){
    $arg1 = "pull"
    Start-Process git -ArgumentList $arg1 -Wait -NoNewWindow
}

New-Alias -Name status -Value gitstatus

function gitstatus(){
    $arg1 = "gstat"
    Start-Process git -ArgumentList $arg1 -Wait -NoNewWindow
}

New-Alias -Name log -Value gitlog
function gitlog{
    $arg1 = "log"
    Start-Process git -ArgumentList $arg1 -Wait -NoNewWindow
}

###...THESE ALIASES BELOW TAKE ARGUMNETS LIKE <branch-name> <url> AND SO ON...###
New-Alias -Name branch -Value gitBranch

function gitBranch([string]$branchName) {
	$arg1 = "branch"
	$allArgs = @($arg1, $branchName)
	Start-Process git -ArgumentList $allArgs -Wait -NoNewWindow
}

New-Alias -Name clone -Value gitclone

function gitclone([string]$url) {
	$arg1 = "clone"
    $allArgs = @($arg1, $url)
	Start-Process git -ArgumentList $allArgs -Wait -NoNewWindow
}

New-Alias -Name add -Value gitadd

function gitadd([string]$file){
    $arg1 = "add"
    $allArgs = @($arg1, $file)
    Start-Process git -ArgumentList $allArgs -Wait -NoNewWindow
}

###There was a persisting error that suggested that Git was interpreting each word in the commit message as a separate file path
###Using the git.exe executable directly, rather than relying on the Start-Process cmdlet fixed the previous problem
###Make sure to adjust the path to git.exe if it's not in your system's PATH. 
New-Alias -Name commit -Value gitcommit

function gitcommit([string]$message){
    $arg1 = "commit"
    $arg2 = "-m"
    $allArgs = @($arg1, $arg2, $message)
    & "git.exe" $allArgs
}


New-Alias -Name checkout -Value gitcheckout

function gitcheckout([string]$branchName){
    $arg1 = "checkout"
    $allArgs = @($arg1, $branchName)
    Start-Process git -ArgumentList $allArgs -Wait -NoNewWindow
}

New-Alias -Name gdiff -Value gitdiff

function gitdiff([string]$branchName1, [string]$branchName2){
    $arg1 = "diff"
    $allArgs = @($arg1, $branchName1, $branchName2 )
    Start-Process git -ArgumentList $allArgs -Wait -NoNewWindow
}

New-Alias -Name show -Value gitshow

function gitshow([string]$commit){
    $arg1 = "show"
    $allArgs = @($arg1, $commit)
    Start-Process git -ArgumentList $allArgs -Wait -NoNewWindow
}

New-Alias -Name branchd -Value gitbranchd

function gitbranchd([string]$branchName){
    $arg1 = "branch"
    $arg2 = "-d"
    $allArgs = @($arg1, $arg2, $branchName)
    Start-Process git -ArgumentList $allArgs -Wait -NoNewWindow
}

New-Alias -Name reset -Value gitreset
function gitreset([string]$commit){
    $arg1 = "reset"
    $allArgs = @($arg1, $commit)
    Start-Process git -ArgumentList $allArgs -Wait -NoNewWindow
}
