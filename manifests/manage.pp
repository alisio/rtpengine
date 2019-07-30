# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include rtpengine::manage
class rtpengine::manage {
  require rtpengine::config
  if ! defined(Service['rtpengine']) {
    service { 'rtpengine':
      ensure     => running,
      enable     => true,
      hasrestart => true,
      hasstatus  => true,
    }
  }
}
