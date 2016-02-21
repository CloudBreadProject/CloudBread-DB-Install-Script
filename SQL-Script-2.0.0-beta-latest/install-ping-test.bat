echo off
SQLCMD -S %1 -U %2 -P %3 -d %4 -i ping-test.sql
