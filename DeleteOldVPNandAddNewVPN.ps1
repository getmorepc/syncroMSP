# Removes old shared user vpn to old server without prompt
Remove-VpnConnection -Name "example.vpnconnection.com" -AllUserConnection -Force

# Adds new VPN shared connection using IKEv2, EAP, Split Tunneling with name. 
# Shared VPN connections show up on the logon page of the users PC
Add-VpnConnection -Name "ExampleVPNName" -ServerAddress "example.vpnconnection.com" -TunnelType "Ikev2" -EncryptionLevel "Required" -AuthenticationMethod Eap -SplitTunneling -AllUserConnection
