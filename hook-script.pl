#!/usr/bin/perl -w

# example hook script for vzdump (--script option)

use strict;

print "HOOK: " . join (' ', @ARGV) . "\n";

my $phase = shift;

if ($phase eq 'job-start' || 
    $phase eq 'job-end'  || 
    $phase eq 'job-abort') { 

    # do what you want 

} elsif ($phase eq 'backup-start' || 
	 $phase eq 'backup-end' ||
	 $phase eq 'backup-abort' || 
	 $phase eq 'pre-stop' ||
	 $phase eq 'pre-restart') {

    print "HOOK: " . join (' ', @ARGV) . "\n";

    my $mode = shift; # stop/suspend/snapshot

    my $vmid = shift;

    my $vmtype = $ENV{VMTYPE}; # openvz/qemu

    my $dumpdir = $ENV{DUMPDIR};

    my $hostname = $ENV{HOSTNAME};

    my $tarfile = $ENV{TARFILE};

    my $logfile = $ENV{LOGFILE};

    print "HOOK-ENV: vmtype=$vmtype;dumpdir=$dumpdir;hostname=$hostname;tarfile=$tarfile;logfile=$logfile\n";

    # example: copy resulting files to another host using scp
    #if ($phase eq 'backup-end') {
    #	system ("scp $tarfile $logfile backup-host:/backup-dir") == 0 ||
    #	    die "copy to backup-host failed";
    #	unlink $tarfile;
    #	unlink $logfile;
    #}
    
} else {

    die "got unknown phase '$phase'";

}

exit (0);
