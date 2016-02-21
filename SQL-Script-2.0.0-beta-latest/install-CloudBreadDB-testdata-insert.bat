echo off
SQLCMD -S %1 -U %2 -P %3 -d %4 -i 2.0.0-beta-CloudBreadDB-testdata-insert.sql
