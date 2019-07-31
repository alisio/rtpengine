#


class rtpengine::install inherits rtpengine {
  if $rtpengine::repo_install {
    yumrepo { 'rpmfusion-free-updates':
      descr      => 'RPM Fusion for EL 7 - Free - Updates',
      enabled    => '1',
      gpgcheck   => '0',
      mirrorlist => 'http://mirrors.rpmfusion.org/mirrorlist?repo=free-el-updates-released-7&arch=$basearch',
    }
    yumrepo { 'alisio-repo':
      descr    => 'alisio-repo',
      enabled  => '1',
      gpgcheck => '0',
      baseurl  => 'http://alisio.com.br/alisio-repo/centos/7',
    }
    if ! defined(Package['$rtpengine::rtpengine_dependencies']) {
      package { $rtpengine::params::rtpengine_dependencies :
        ensure  => installed,
        require => Yumrepo['rpmfusion-free-updates'],
      }
    }
  } else {
    if ! defined(Package['$rtpengine::rtpengine_dependencies']) {
      package { $rtpengine::params::rtpengine_dependencies :
        ensure => installed,
      }
    }
  }
}
