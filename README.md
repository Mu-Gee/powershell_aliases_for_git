# powershell_aliases_for_git
So you recently moved back to windows or have sarted developing on windows and 
encountered the long git commands which you'd like to shorten, don't worry, why? Because I gatchu my friend.
In Windows, setting aliases and making them permanent are a little bit trickier than Linux.
## Aliases in Windows ##
To check if we can create an alias in PowerShell, let’s try this command:
```
New-Alias -Name g -Value git
```
Using our new alias g, we can see the git version with command:
```
g --version
```
Note: This alias will be gone when we restart (reopen) PowerShell, since it is not permanent yet.
## Making Aliases Permanent in Windows ##
In order to make our aliases permanent, we should first find the location of the profile file of PowerShell, by typing:
```
echo $profile
```
Response will be something similar to this:
`C:\Users\user\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1`

Go to that folder location and see if there is a file named above, if not, create that file as an empty file with ps1 extension, restart your PowerShell and see if everything is OK. If you see an error like this:
```
scripts is disabled on this system. For more information, see about_Execution_Policies at https:/go.microsoft.com/fwlin
k/?LinkID=135170.
At line:1 char:3
+ . 'C:\Users\user\Documents\WindowsPowerShell\Microsoft.PowerShell_p ...
+   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    + CategoryInfo: SecurityError: (:) [], PSSecurityException
    + FullyQualifiedErrorId : UnauthorizedAccess
```

It means that your Execution-Policy prevents running PowerShell profiles. In order to run PowerShell profiles, you can run command below and restart PowerShell.

```
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```
## 1. Basic Alias ##
Let’s start to create a basic alias for git by adding line below to our ps1 file:
```
New-Alias -Name g -Value git
```
***WHENEVER YOU MODIFY YOUR PS1 FILE, RESTART YOUR POWERSHELL TO UPDATE CHANGES.***

g became an alias for command git. After restarting PowerShell, we can run git --version command with our new alias as follows:
```
g --version
```
## 2. Aliases with Arguments ##
Although, the things we have done so far are similar to aliases in Linux, things are getting a little bit complicated for commands with arguments, such as 
`git status` `git pull` etc. In order to make an alias named status for the git status command, we should use function and ArgumentList:
```
New-Alias -Name status -Value gitstatus

function gitstatus(){
    $arg1 = "status"
    Start-Process git -ArgumentList $arg1 -Wait -NoNewWindow
}
```



In order to create alias for commands which take parameters, e.g., `git branch <branchName>` which has `<branchName>` parameter
Use the format:

With this newly created alias, command below checks for the status of the current development branch:
```
status
```
