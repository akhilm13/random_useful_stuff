#make tar of folder with backup_currentdate as name
sudo tar -cvf $(echo backup`date +%d%m%Y`.tar.gz) foldername

#dump sql file with date in name
mysqldump -u username database --no-tablespaces -p > $(echo sqlDump`date +%d%m%Y`.sql)