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
	cmd /c  "mysql --user=root --password=gravitant bts   <" $objFile.FullName
    }
}


foreach ($objFile in $colFiles)
{	#sds db import
	if ($objFile.Name -match "sds")
    {
    Write-Host $objFile
	cmd /c  "mysql --user=root --password=gravitant sds   <" $objFile.FullName
    }
}


foreach ($objFile in $colFiles)
{
	#ODS db import
	if ($objFile.Name -match "ods")
    {
    Write-Host $objFile
	cmd /c  "mysql --user=root --password=gravitant ods   <" $objFile.FullName
    }
}

foreach ($objFile in $colFiles)
{
	#sfb db import
	if ($objFile.Name -match "sfb")
    {
    Write-Host $objFile
	cmd /c  "mysql --user=root --password=gravitant sfb   <" $objFile.FullName
    }
}

foreach ($objFile in $colFiles)
{
	#tags db import
	if ($objFile.Name -match "tags")
    {
    Write-Host $objFile
	cmd /c  "mysql --user=root --password=gravitant tags   <" $objFile.FullName
    }
}


foreach ($objFile in $colFiles)
{
    #softlayer DB import
    if ($objFile.Name -match "softlayer")
    {
    Write-Host $objFile
	cmd /c "mysql --user=root --password=gravitant softlayer   <" $objFile.FullName
    }
}

foreach ($objFile in $colFiles)

{
	#demo db import
	if ($objFile.Name -match "demo")
    {
    Write-Host $objFile
	cmd /c "mysql --user=root --password=gravitant demo   <" $objFile.FullName
    }


}

foreach ($objFile in $colFiles)

{
	#demo db import
	if ($objFile.Name -match "pyscreener")
    {
    Write-Host $objFile
	cmd /c "mysql --user=root --password=gravitant pyscreener   <" $objFile.FullName
    }


}

foreach ($objFile in $colFiles)

{
	#demo db import
	if ($objFile.Name -match "comparedb")
    {
    Write-Host $objFile
	cmd /c "mysql --user=root --password=gravitant comparedb   <" $objFile.FullName
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
