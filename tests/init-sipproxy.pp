class {'rtpengine':
rtpengine_ctrl_socket => '127.0.0.1:22222',
}
-> class{'opensips':
  mediaproxy_type => 'rtpengine',
}
-> class{'opensipscp':}
