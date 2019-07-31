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

### What rtpengine affects

This module affects the following:

* Adds yum repositories for dependencies
* Installs rtpengine and dependencies packages
* Enables rtpengine service

### Setup Requirements **OPTIONAL**

This module requires

If your module requires anything extra before setting up (pluginsync enabled, another module, etc.), mention it here.

If your most recent release breaks compatibility or requires particular steps for upgrading, you might want to include an additional "Upgrading" section here.

### Beginning with rtpengine

All you need to get this module up and running is calling the class:

```
include rtpengine
```

Parameters
@repo_install
  Boolean variable that controls if this module should config the required repositories. Default to true
@rtpengine_ctrl_socket
  String containing either just a port number, or an address:port pair, separated
  by colon, of the control socket. Default to '127.0.0.1:22223'
@rtpengine_listen_interface
  Specifies a local network interface for listening to the RTP packets. Default to the Ip address of the first ethernet interface
@rtpengine_min_port
  Integer defining the minimum local port from which rtpengine will allocate UDP ports for media traffic relay.  Default to 30000.
@rtpengine_max_port
  Integer defining the maximum local port from which rtpengine will allocate UDP ports for media traffic relay.  Default to 40000.
@rtpengine_max_sessions
  Integer defining the limit the number of maximum concurrent sessions. Default to 16000
@rtpengine_syslog_local


```
class{'rtpengine':
  rtpengine_min_port => 10000,
  rtpengine_max_port => 20000,
  repo_install      => true  ,
}
```


## Usage

Include usage examples for common use cases in the **Usage** section. Show your users how to use your module to solve problems, and be sure to include code examples. Include three to five examples of the most important or common tasks a user can accomplish with your module. Show users how to accomplish more complex tasks that involve different types, classes, and functions working in tandem.

## Reference

This section is deprecated. Instead, add reference information to your code as Puppet Strings comments, and then use Strings to generate a REFERENCE.md in your module. For details on how to add code comments and generate documentation with Strings, see the Puppet Strings [documentation](https://puppet.com/docs/puppet/latest/puppet_strings.html) and [style guide](https://puppet.com/docs/puppet/latest/puppet_strings_style.html)

If you aren't ready to use Strings yet, manually create a REFERENCE.md in the root of your module directory and list out each of your module's classes, defined types, facts, functions, Puppet tasks, task plans, and resource types and providers, along with the parameters for each.

For each element (class, defined type, function, and so on), list:

  * The data type, if applicable.
  * A description of what the element does.
  * Valid values, if the data type doesn't make it obvious.
  * Default value, if any.

For example:

```
### `pet::cat`

#### Parameters

##### `meow`

Enables vocalization in your cat. Valid options: 'string'.

Default: 'medium-loud'.
```

## Limitations

In the Limitations section, list any incompatibilities, known issues, or other warnings.

## Development

In the Development section, tell other users the ground rules for contributing to your project and how they should submit their work.

## Release Notes/Contributors/Etc. **Optional**

If you aren't using changelog, put your release notes here (though you should consider using changelog). You can also add any additional sections you feel are necessary or important to include here. Please use the `## ` header.
