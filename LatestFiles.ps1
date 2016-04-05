
#Drop Al Databases
"
#####################################################
Droping all App related DB hope you have made backup
#####################################################
"
&cmd /c "mysql --user=root --password=gravitant mysql  < DropAllDB.SQL"
#Crete all DB Schema
"
#####################################################
Creating all new schema for app related DB
#####################################################

"
&cmd /c "mysql --user=root --password=gravitant mysql  < CreateSchm.SQL"




$colFiles = Get-ChildItem C:\DBAutomation\DBDropFilesOnly 

foreach ($objFile in $colFiles)
{
	
	
	#bts DB import
    if ($objFile.Name -match "bts")
    {
    Write-Host $objFile
	&cmd /c  "mysql --user=root --password=gravitant bts   <" $objFile.FullName
    }
	
	
	#sds db import 
	if ($objFile.Name -match "sds")
    {
    Write-Host $objFile
	&cmd /c  "mysql --user=root --password=gravitant sds   <" $objFile.FullName
    }
	
	#ODS db import 
	if ($objFile.Name -match "ods")
    {
    Write-Host $objFile
	&cmd /c  "mysql --user=root --password=gravitant ods   <" $objFile.FullName
    }
		
	#sfb db import 
	if ($objFile.Name -match "sfb")
    {
    Write-Host $objFile
	&cmd /c  "mysql --user=root --password=gravitant sfb   <" $objFile.FullName
    }
	
	#tags db import 
	if ($objFile.Name -match "tags")
    {
    Write-Host $objFile
	&cmd /c  "mysql --user=root --password=gravitant tags   <" $objFile.FullName
    }
	
    #softlayer DB import
    if ($objFile.Name -match "softlayer")
    {
    Write-Host $objFile
	&cmd /c "mysql --user=root --password=gravitant softlayer   <" $objFile.FullName
    }
	

}

#Update bts tables
"
#####################################################
Updating bts database tables to values for local instance
#####################################################
"

&cmd /c "mysql --user=root --password=gravitant bts   <" UpdateBts.sql
    

"
##########################################################################################################
All tasks are done now just go ahead and restart jboss server from eclipse to start CM instance.
##########################################################################################################
"
	

    
   
