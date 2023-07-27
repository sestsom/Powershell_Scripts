If running scripts is disabled:

1. Open PowerShell as an administrator. You can do this by searching for PowerShell in the start menu, right-clicking on it, and selecting "Run as administrator".

2. Check the current execution policy by typing `Get-ExecutionPolicy`.

3. If the policy is not set to RemoteSigned or Unrestricted, you can change the execution policy by typing `Set-ExecutionPolicy RemoteSigned`. This policy allows local scripts to run without a digital signature, but downloaded scripts must be signed by a trusted publisher.

You'll see a prompt asking to confirm the change, to which you can reply **Y for Yes** or A for Yes to All.

Keep in mind that these steps change the execution policy for all PowerShell sessions. If you want to change the execution policy for only the current session, you can do so by adding -Scope Process to the command:

`Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope Process`

This command sets the execution policy for the current session only, and the change is discarded when the session is closed. You would then need to set the execution policy each time you open a new session to run the script.

Remember, adjusting the execution policy can expose your system to risks. If you set the execution policy to `Unrestricted`, be sure to only run scripts that you trust.

**Process_CPU_Threshold50.ps1** --> [https://www.stefansommarsjo.com/posts/script-to-monitor-cpu-usage/](https://www.stefansommarsjo.com/posts/script-to-monitor-cpu-usage/).
