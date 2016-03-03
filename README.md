# CloudBread-DB-Install-Script
CloudBread database installation scripts including table, database oject and stored prodecure

##Brief install guide.
Install SQLCMD cli-tool to execute batch file on this project.
Execute batch file with below parameters in latest released directory.

somebatchfile.bat SQLSERVER USERID PASSWORD DATABASE

###1) install-ping-test.bat
Test connection with remote server.

```
ping-test.bat SQLSERVER USERID PASSWORD DATABASE
```

###2) install-with-sample.bat.bat
Install all database objects , stored procedures and sample data.

```
install-CloudBreadDB-object-create.bat SQLSERVER USERID PASSWORD DATABASE
```


This project is designed for sql database developer to build CloudBread mobile game server engine backend. For more information about installation and deployment on database, visit CloudBread official project website.

CloudBread official site : https://github.com/CloudBreadProject/CloudBread

License : MIT license
