#!/usr/bin/perl -w

use strict;
use ZoneMinder;

$| = 1;

zmDbgInit( "myscript", level=>0, to_log=>0, to_syslog=>0, to_term=>1 );

my $dbh = DBI->connect( "DBI:mysql:database=".ZM_DB_NAME.";host=".ZM_DB_HOST, ZM_DB_USER, ZM_DB_PASS );

my $sql = "select M.*, max(E.Id) as LastEventId from Monitors as M left join Events as E on M.Id = E.MonitorId where M.Function != 'None' group by (M.Id)";
my $sth = $dbh->prepare_cached( $sql ) or die( "Can't prepare '$sql': ".$dbh->errstr() );

my $res = $sth->execute() or die( "Can't execute '$sql': ".$sth->errstr() );
my @monitors;
while ( my $monitor = $sth->fetchrow_hashref() )
{
    push( @monitors, $monitor );
}

while( 1 )
{
    foreach my $monitor ( @monitors )
    {
        next if ( !zmMemVerify( $monitor ) );
if ( defined( zmMemRead( $monitor, "shared_data:last_event" )) ) {
                if ( defined( $monitor->{LastEventId} ))
                {
        if ( my $last_event_id = zmHasAlarmed( $monitor, $monitor->{LastEventId} ) )
        {
            $monitor->{LastEventId} = $last_event_id;
            print( "Monitor ".$monitor->{Name}." has alarmed\n" );
 
#play /home/orlovic/thrust.wav           #
            # Do your stuff here
            #
        }
    }}}
    sleep( 1 );
}

