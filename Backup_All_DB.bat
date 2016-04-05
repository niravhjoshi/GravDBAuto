@echo on 
@echo --------------------------------------------------------------------------------------------------------------------------
set d=%date:~-4,4%%date:~-7,2%%date:~0,2%
set d=%d: =_%
set t=%time:~0,2%%time:~3,2%%time:~6,2%
set t=%t: =0%
echo "FileName_%d%_%t%"
@echo --------------------------------------------------------------------------------------------------------------------------
@echo Starting Copying MySQL Database file from server to destination.
cd \
@echo --------------------------------------------------------------------------------------------------------------------------
mysqldump --skip-triggers  --no-create-info --user=root --password=gravitant --databases bts  >  "C:\DBAutomation\Backup\DBs\bts__%d%_%t%.sql"
mysqldump --skip-triggers  --no-create-info --user=root --password=gravitant --databases ods  >  "C:\DBAutomation\Backup\DBs\ods__%d%_%t%.sql"
mysqldump --skip-triggers  --no-create-info --user=root --password=gravitant --databases sds  >  "C:\DBAutomation\Backup\DBs\sds__%d%_%t%.sql"
mysqldump --skip-triggers  --no-create-info --user=root --password=gravitant --databases sfb  >  "C:\DBAutomation\Backup\DBs\sfb__%d%_%t%.sql"
mysqldump --skip-triggers  --no-create-info --user=root --password=gravitant --databases softlayer  >  "C:\DBAutomation\Backup\DBs\softlayer__%d%_%t%.sql"
mysqldump --skip-triggers  --no-create-info --user=root --password=gravitant --databases tags  >  "C:\DBAutomation\Backup\DBs\tags__%d%_%t%.sql"
mysqldump --skip-triggers  --no-create-info --user=root --password=gravitant --databases pyscreener  >  "C:\DBAutomation\Backup\DBs\pyscreener__%d%_%t%.sql"
mysqldump --skip-triggers  --no-create-info --user=root --password=gravitant --databases comparedb  >  "C:\DBAutomation\Backup\DBs\comparedb__%d%_%t%.sql"


@echo --------------------------------------------------------------------------------------------------------------------------
cd \
cd C:\DBAutomation\Backup\
@echo Backup_Completed
@echo --------------------------------------------------------------------------------------------------------------------------
