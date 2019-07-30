# @summary This module installs Sipwise NGCP rtpengine
#
# This class installs Sipwise NGCP rtpengine. Rtpengine is a proxy for RTP traffic and other UDP based media traffic.
#
# @example
#   include rtpengine
#
# class{'rtpengine':
#   rtpengine_min_port => 10000,
#   rtpengine_max_port => 20000,
#   repo_install      => true  ,
# }
#
# Parameters
#
# @repo_install
#   Boolean variable that controls if this module should config the required repositories. Default to true
# @rtpengine_ctrl_socket
#   String containing either just a port number, or an address:port pair, separated
#   by colon, of the control socket. Default to '127.0.0.1:22223'
# @rtpengine_listen_interface
#   Specifies a local network interface for listening to the RTP packets. Default to the Ip address of the first ethernet interface
# @rtpengine_min_port
#   Integer defining the minimum local port from which rtpengine will allocate UDP ports for media traffic relay.  Default to 30000.
# @rtpengine_max_port
#   Integer defining the maximum local port from which rtpengine will allocate UDP ports for media traffic relay.  Default to 40000.
# @rtpengine_max_sessions
#   Integer defining the limit the number of maximum concurrent sessions. Default to 16000
# @rtpengine_syslog_local
class rtpengine (
  $repo_install               = $rtpengine::params::repo_install,
  $rtpengine_dependencies     = $rtpengine::params::rtpengine_dependencies,
  $rtpengine_ctrl_socket      = $rtpengine::params::rtpengine_ctrl_socket,
  $rtpengine_listen_interface = $rtpengine::params::rtpengine_listen_interface,
  $rtpengine_min_port         = $rtpengine::params::rtpengine_min_port,
  $rtpengine_max_port         = $rtpengine::params::rtpengine_max_port,
  $rtpengine_max_sessions     = $rtpengine::params::rtpengine_max_sessions,
  $rtpengine_syslog_local     = $rtpengine::params::rtpengine_syslog_local,
  ) inherits rtpengine::params {
    include rtpengine::install
    include rtpengine::config
    include rtpengine::manage
}
