# get Firefox process
$jboss = Get-Process WinSCP -ErrorAction SilentlyContinue
$a = new-object -comobject wscript.shell 

write $jboss
if ($jboss) 
 {

$intAnswer = $a.popup("Do you want to Stop Java Jboss Process It is recomended to Stop Jboss before you start import of DB?",0,"Jboss is running !!!!",4) 
If ($intAnswer -eq 6) 
{ 
    $a.popup("Stopping Joboss") 
    $jboss.CloseMainWindow()

}
else 
{ 
    $a.popup("Aww that will be awfull!!!. PLease stop Jboss I am stoping jboss") 
	Sleep 5
	if (!$jboss.HasExited) 
	{
    $jboss | Stop-Process -Force
	}
} 
 
 # DB Import Code Place Holder
  
  
  
  }
else
{
$a.popup("No Jboss is running") 
	
Remove-Variable jboss
}




