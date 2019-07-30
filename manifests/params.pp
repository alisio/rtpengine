# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include rtpengine::params
class rtpengine::params {
  $repo_install               = false
  $rtpengine_dependencies     = [
    'epel-release',
    'ffmpeg',
    'rtpengine',
  ]
  $rtpengine_ctrl_socket      = '127.0.0.1:22223'
  $rtpengine_listen_interface = $facts['ipaddress']
  $rtpengine_min_port         = 30000
  $rtpengine_max_port         = 40000
  $rtpengine_max_sessions     = 16000
  $rtpengine_syslog_local     = 5
}
