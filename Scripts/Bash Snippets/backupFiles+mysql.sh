#make tar of folder with backup_currentdate as name
sudo tar -cvf $(echo backup`date +%d%m%Y`.tar.gz) foldername

#dump sql file with date in name
sudo touch $(echo sqlDump`date +%d%m%Y`.sql)
sudo chmod 777 sqlDump19052020.sql
mysqldump -u username database -p > $(echo sqlDump`date +%d%m%Y`.sql)