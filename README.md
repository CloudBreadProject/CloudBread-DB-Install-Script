# CloudBread-DB-Install-Script
CloudBread database installation scripts including table, database oject and stored prodecure

##Brief install guide.
Option #1 
Install SQL Express - management tool at this link - https://www.microsoft.com/en-US/download/details.aspx?id=42299 
The x86 version(MgmtStudio 32BIT\SQLManagementStudio_x86_ENU.exe) or x64 version(MgmtStudio 64BIT\SQLManagementStudio_x64_ENU.exe) including SQLCMD cli tool.

Option #2
Only install SQLCMD cli-tool to execute batch file on this project.(You might need ODBC installation at the first of all)
Execute batch file with below parameters in released directory.

somebatchfile.bat SQLSERVER USERID PASSWORD DATABASE

###1) install-ping-test.bat
Test connection with remote SQL server.

```
ping-test.bat SQLSERVER USERID PASSWORD DATABASE
```

###2) install-with-sample.bat
Install all database objects , stored procedures and sample data.

```
install-with-sample.bat SQLSERVER USERID PASSWORD DATABASE
```



This project is designed for sql database developer to build CloudBread mobile game server engine backend. For more information about installation and deployment on database, visit CloudBread official project website.

CloudBread official site : https://github.com/CloudBreadProject/CloudBread

License : MIT license
