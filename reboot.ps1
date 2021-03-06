####################################################################### 
# Author : Chethan Gatty
# This PS script provides Uptime and Pingstatus for list of computers.
#######################################################################
		$names = Get-Content "C:\Users\Suyash\Documents\server.txt"
        @(
		   foreach ($name in $names)
	      {
            if ( Test-Connection -ComputerName $name -Count 1 -ErrorAction SilentlyContinue ) 
		  {
            Get-EventLog -LogName System -Source "EventLog" -EntryType Error | Where {$_.EventID -eq 6008}		
		  }
             else {
                Write-output "$name is not pinging"
		          }
       		}
		 ) | Out-file -FilePath "C:\Users\Suyash\Documents\result.txt"
		 

		

    