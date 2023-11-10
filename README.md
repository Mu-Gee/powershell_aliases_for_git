# powershell_aliases_for_git
Setting Permanent Aliases for Windows PowerShell or Terminal
So you recently moved back to windows or have sarted developing on windows and 
encountered the long git commands which you'd like to shorten, don't worry, why? Because I gatchu my friend.
In Windows, setting aliases and making them permanent are a little bit trickier than Linux.
## Aliases in Windows ##
To check if we can create an alias in PowerShell, let’s try this command:
`New-Alias -Name g -Value git`
Using our new alias g, we can see the git version with command:
`g --version`
Note: This alias will be gone when we restart (reopen) PowerShell, since it is not permanent yet.
## Making Aliases Permanent in Windows ##
