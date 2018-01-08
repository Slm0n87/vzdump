# vzdump
OpenVZ backup scripts

Patches based on latest debian sid/buster: https://packages.debian.org/buster/vzdump  

```
dpkg-source: info: extracting vzdump in vzdump-1.2.6
dpkg-source: info: unpacking vzdump_1.2.6.orig.tar.gz
dpkg-source: info: applying vzdump_1.2.6-5.diff.gz
dpkg-source: info: upstream files that have been modified:
 vzdump-1.2.6/Makefile
 vzdump-1.2.6/OpenVZ.pm
 vzdump-1.2.6/VZDump.pminitial commit vzdump_1.2.6  …
```

## --noarch
did not create a tar archive but keeps the resulting
dump into a directory
this allows real incremental backup

## --mail-error-only
send notification mail to address(es) defined by --mailto only if a dump failed.
