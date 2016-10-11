# get javaw process
$jboss = Get-Process javaw -ErrorAction SilentlyContinue
$a = new-object -comobject wscript.shell 

write $jboss
if ($jboss) 
    {

	        $intAnswer = $a.popup("Do you want to Stop Java Jboss Process It is recomended to Stop Jboss before you start import of DB?",0,"Jboss is running !!!!",4) 
	        If ($intAnswer -eq 6) 
	        { 
		        $a.popup("Stopping Joboss") 
		        $jboss | Stop-Process -Force

	        }


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


            #Database Import will start
                
                #bts database
                if ($colFiles = Get-ChildItem C:\DBAutomation\DBDropFilesOnly -Filter *bts*)
                    {
                    Write-Host $colFiles
	                cmd /c  "mysql --user=root --password=gravitant bts   <" $colFiles.FullName
                    }
                else
                    {
                    Write-Host "I did not get any bts file"
                    }


                #tags database
                if ($colFiles = Get-ChildItem C:\DBAutomation\DBDropFilesOnly -Filter *tags*)
                    {
                    Write-Host $colFiles
	                cmd /c  "mysql --user=root --password=gravitant tags   <" $colFiles.FullName
                    }
                else
                    {
                    Write-Host "I did not get any tags file"
                    }
                
                #cme database
                if ($colFiles = Get-ChildItem C:\DBAutomation\DBDropFilesOnly -Filter *cme*)
                    {
                    Write-Host $colFiles
	                cmd /c  "mysql --user=root --password=gravitant cme   <" $colFiles.FullName
                    }
                else
                    {
                    Write-Host "I did not get any cme file"
                    }


                #sds database
                if ($colFiles = Get-ChildItem C:\DBAutomation\DBDropFilesOnly -Filter *sds*)
                    {
                    Write-Host $colFiles
	                cmd /c  "mysql --user=root --password=gravitant sds   <" $colFiles.FullName
                    }
                else
                    {
                    Write-Host "I did not get any sds file"
                    }

                #ods database
                if ($colFiles = Get-ChildItem C:\DBAutomation\DBDropFilesOnly -Filter *ods*)
                    {
                    Write-Host $colFiles
	                cmd /c  "mysql --user=root --password=gravitant ods   <" $colFiles.FullName
                    }
                else
                    {
                    Write-Host "I did not get any ods file"
                    }

                #sfb database
                if ($colFiles = Get-ChildItem C:\DBAutomation\DBDropFilesOnly -Filter *sfb*)
                    {
                    Write-Host $colFiles
	                cmd /c  "mysql --user=root --password=gravitant sfb   <" $colFiles.FullName
                    }
                else
                    {
                    Write-Host "I did not get any sfb file"
                    }
	

                #softlayer database
                if ($colFiles = Get-ChildItem C:\DBAutomation\DBDropFilesOnly -Filter *softlayer*)
                    {
                    Write-Host $colFiles
	                cmd /c  "mysql --user=root --password=gravitant softlayer   <" $colFiles.FullName
                    }
                else
                    {
                    Write-Host "I did not get any softlayer file"
                    }
	
                #demo database
                if ($colFiles = Get-ChildItem C:\DBAutomation\DBDropFilesOnly -Filter *demo*)
                    {
                    Write-Host $colFiles
	                cmd /c  "mysql --user=root --password=gravitant demo   <" $colFiles.FullName
                    }
                else
                    {
                    Write-Host "I did not get any demo file"
                    }
                #pyscreener  database
                if ($colFiles = Get-ChildItem C:\DBAutomation\DBDropFilesOnly -Filter *pyscreener*)
                    {
                    Write-Host $colFiles
	                cmd /c  "mysql --user=root --password=gravitant pyscreener   <" $colFiles.FullName
                    }
                else
                    {
                    Write-Host "I did not get any pyscreener file"
                    }	
	
	
                #compare database
                if ($colFiles = Get-ChildItem C:\DBAutomation\DBDropFilesOnly -Filter *compare*)
                    {
                    Write-Host $colFiles
	                cmd /c  "mysql --user=root --password=gravitant comparedb   <" $colFiles.FullName
                    }
                else
                    {
                    Write-Host "I did not get any comparedb file"
                    }

		#jobdb database
                if ($colFiles = Get-ChildItem C:\DBAutomation\DBDropFilesOnly -Filter *jobdb*)
                    {
                    Write-Host $colFiles
	                cmd /c  "mysql --user=root --password=gravitant jobdb   <" $colFiles.FullName
                    }
                else
                    {
                    Write-Host "I did not get any jobdb file"
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
	

	
    }


else
    {


            $a.popup("No Jboss is running") 
	
            Remove-Variable jboss

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

                    #bts database
                    if ($colFiles = Get-ChildItem C:\DBAutomation\DBDropFilesOnly -Filter *bts*)
                        {
                        Write-Host $colFiles
	                    cmd /c  "mysql --user=root --password=gravitant bts   <" $colFiles.FullName
                        }
                    else
                        {
                        Write-Host "I did not get any bts file"
                        }


                    #tags database
                    if ($colFiles = Get-ChildItem C:\DBAutomation\DBDropFilesOnly -Filter *tags*)
                        {
                        Write-Host $colFiles
	                    cmd /c  "mysql --user=root --password=gravitant tags   <" $colFiles.FullName
                        }
                    else
                        {
                        Write-Host "I did not get any tags file"
                        }
                    #cme database
                    if ($colFiles = Get-ChildItem C:\DBAutomation\DBDropFilesOnly -Filter *cme*)
                        {
                        Write-Host $colFiles
	                    cmd /c  "mysql --user=root --password=gravitant cme   <" $colFiles.FullName
                        }
                    else
                        {
                        Write-Host "I did not get any cme file"
                        }

                    #sds database
                    if ($colFiles = Get-ChildItem C:\DBAutomation\DBDropFilesOnly -Filter *sds*)
                        {
                        Write-Host $colFiles
	                    cmd /c  "mysql --user=root --password=gravitant sds   <" $colFiles.FullName
                        }
                    else
                        {
                        Write-Host "I did not get any sds file"
                        }

                    #ods database
                    if ($colFiles = Get-ChildItem C:\DBAutomation\DBDropFilesOnly -Filter *ods*)
                        {
                        Write-Host $colFiles
	                    cmd /c  "mysql --user=root --password=gravitant ods   <" $colFiles.FullName
                        }
                    else
                        {
                        Write-Host "I did not get any ods file"
                        }

                    #sfb database
                    if ($colFiles = Get-ChildItem C:\DBAutomation\DBDropFilesOnly -Filter *sfb*)
                        {
                        Write-Host $colFiles
	                    cmd /c  "mysql --user=root --password=gravitant sfb   <" $colFiles.FullName
                        }
                    else
                        {
                        Write-Host "I did not get any sfb file"
                        }
	

                    #softlayer database
                    if ($colFiles = Get-ChildItem C:\DBAutomation\DBDropFilesOnly -Filter *softlayer*)
                        {
                        Write-Host $colFiles
	                    cmd /c  "mysql --user=root --password=gravitant softlayer   <" $colFiles.FullName
                        }
                    else
                        {
                        Write-Host "I did not get any softlayer file"
                        }
	
                    #demo database
                    if ($colFiles = Get-ChildItem C:\DBAutomation\DBDropFilesOnly -Filter *demo*)
                        {
                        Write-Host $colFiles
	                    cmd /c  "mysql --user=root --password=gravitant demo   <" $colFiles.FullName
                        }
                    else
                        {
                        Write-Host "I did not get any demo file"
                        }
                    #pyscreener  database
                    if ($colFiles = Get-ChildItem C:\DBAutomation\DBDropFilesOnly -Filter *pyscreener*)
                        {
                        Write-Host $colFiles
	                    cmd /c  "mysql --user=root --password=gravitant pyscreener   <" $colFiles.FullName
                        }
                    else
                        {
                        Write-Host "I did not get any pyscreener file"
                        }	
	
	
                    #comparedb database
                    if ($colFiles = Get-ChildItem C:\DBAutomation\DBDropFilesOnly -Filter *comparedb*)
                        {
                        Write-Host $colFiles
	                    cmd /c  "mysql --user=root --password=gravitant comparedb   <" $colFiles.FullName
                        }
                    else
                        {
                        Write-Host "I did not get any comparedb file"
                        }
          
		   #jobdb database
                    if ($colFiles = Get-ChildItem C:\DBAutomation\DBDropFilesOnly -Filter *jobdb*)
                       {
                        Write-Host $colFiles
	                cmd /c  "mysql --user=root --password=gravitant jobdb   <" $colFiles.FullName
                       }
                    else
                       {
                        Write-Host "I did not get any jobdb file"
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
	

    
   

    }
