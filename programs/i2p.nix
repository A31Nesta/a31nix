{ ... }: {
  # File taken from this blog:
  # https://voidcruiser.nl/rambles/i2p-on-nixos/

  networking.firewall.allowedTCPPorts = [
    7070 # default web interface port
    4447 # default socks proxy port
    4444 # default http proxy port
  ];

  services.i2pd = {
    enable = true;
    address = "0.0.0.0";
    proto = {
      http.enable = true;
      socksProxy.enable = true;
      httpProxy.enable = true;
    };
  };
}
