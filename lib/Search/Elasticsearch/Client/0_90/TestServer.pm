package Search::Elasticsearch::Client::0_90::TestServer;

use strict;
use warnings;

#===================================
sub command_line {
#===================================
    my ( $class, $ts, $pid_file, $dir, $transport, $http ) = @_;

    return (
        $ts->es_home . '/bin/elasticsearch',
        '-f', '-p',
        $pid_file->filename,
        map {"-Des.$_"} (
            'path.data=' . $dir,
            'network.host=127.0.0.1',
            'cluster.name=es_test',
            'discovery.zen.ping_timeout=1s',
            'discovery.zen.ping.multicast.enabled=false',
            'discovery.zen.ping.unicast.hosts=127.0.0.1:' . $ts->es_port,
            'transport.tcp.port=' . $transport,
            'http.port=' . $http,
            @{ $ts->conf }
        )
    );
}

1
