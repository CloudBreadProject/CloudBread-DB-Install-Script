# CloudBread-DB-Install-Script
CloudBread database installation scripts including table, database oject and stored prodecure

##Brief install guide.
Install SQLCMD cli-tool to execute batch file on this project.
Execute batch file with below parameters in latest released directory.

somebatchfile.bat SQLSERVER USERID PASSWORD DATABASE

###1) install-ping-test.bat
Test connection with remote server.

```
install-ping-test.bat SQLSERVER USERID PASSWORD DATABASE
```

###2) install-CloudBreadDB-object-create.bat
Install database objects includeing table, PK, constraint and etc.

```
install-CloudBreadDB-object-create.bat SQLSERVER USERID PASSWORD DATABASE
```

###3) install-CloudBreadDB-testdata-insert.bat and install-CloudBreadDB-statsdata-testdata-insert.bat
Install sample data for developing and testing.

```
install-CloudBreadDB-testdata-insert.bat SQLSERVER USERID PASSWORD DATABASE
install-CloudBreadDB-statsdata-testdata-insert.bat SQLSERVER USERID PASSWORD DATABASE
```

###4) subfolder/install-sp.bat
Install stored proedures of CloudBread database.

```
install-sp.bat SQLSERVER USERID PASSWORD DATABASE
```

This project is designed for sql database developer to build CloudBread mobile game server engine backend. For more information about installation and deployment on database, visit CloudBread official project website.

CloudBread official site : https://github.com/CloudBreadProject/CloudBread

License : MIT license
