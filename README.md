# rtpengine

#### Table of Contents

1. [Description](#description)
2. [Setup](#setup)
    * [What rtpengine affects](#what-rtpengine-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with rtpengine](#beginning-with-rtpengine)
3. [Usage](#usage)
4. [Limitations](#limitations)
5. [Development](#development)

## Description

This module installs, configure and manages Sipwise NGCP rtpengine.

The Sipwise NGCP rtpengine is a proxy for RTP traffic and other UDP based media traffic. It's meant to be used with the Kamailio or OpenSIPS SIP proxy and forms a drop-in replacement for any of the other available RTP and media proxies.

For more information please refer to the project repository: https://github.com/sipwise/rtpengine


## Setup

This module affects the following:

* Adds yum repositories for dependencies
* Installs rtpengine and dependencies packages
* Enables rtpengine service

### Setup Requirements

This module requires Kamailio or OpenSIPS SIP proxy with the apropriate rtpengine module loaded.

The following snippet illustrates the rtpengine.so module config on opensips:

```
loadmodule "rtpengine.so"
modparam("rtpengine", "rtpengine_sock", "udp:127.0.0.1:22223") # CUSTOMIZE ME

```

For more information on how to configure rtpengine module on OpenSIPS please refer to the rtpengine [Admin guide](https://opensips.org/html/docs/modules/2.4.x/rtpengine)


### Beginning with rtpengine

All you need to get this module up and running is calling the class:

```
include rtpengine
```

## Usage

```
class{'rtpengine':
  rtpengine_min_port => 10000,
  rtpengine_max_port => 20000,
  repo_install      => false,
}
```

#### Parameters

* `$repo_install`   Boolean variable that controls if this module should config the required repositories. Default to true
* `$rtpengine_ctrl_socket`   String containing either just a port number, or an address:port pair, separated   by colon, of the control socket. Default to '127.0.0.1:22223'
* `$rtpengine_listen_interface`   Specifies a local network interface for listening to the RTP packets. Default to the Ip address of the first ethernet interface
* `$rtpengine_min_port`   Integer defining the minimum local port from which rtpengine will allocate UDP ports for media traffic relay.  Default to 30000.
* `$rtpengine_max_port`   Integer defining the maximum local port from which rtpengine will allocate UDP ports for media traffic relay.  Default to 40000.
* `$rtpengine_max_sessions`   Integer defining the limit the number of maximum concurrent sessions. Default to 16000
* `$rtpengine_syslog_local` Integer. Syslog level for opensips and rtpproxy log. Default to 5


## Reference Reading

* Opensips: https://www.opensips.org/Documentation/Manual-2-4
* Kamailio: https://www.kamailio.org/w/documentation/
* RTPEngine: https://github.com/sipwise/rtpengine


## Limitations

This module was tested on CentOS 7 with OpenSIPS 2.4


## Development

Please follow the licence guidelines
