# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include rtpengine::config
class rtpengine::config inherits rtpengine {
  require rtpengine::install
  file { '/etc/rtpengine/rtpengine.conf':
    ensure  => file,
    mode    => '0644',
    content => template('rtpengine/etc/rtpengine/rtpengine.conf.erb')
  }
  augeas {'set_service_boot_order':
    context => '/files/lib/systemd/system/rtpengine.service',
    changes => [
      'set /files/lib/systemd/system/rtpengine.service/Unit/Before/value[1] opensips.service',
    ],
  }
}
