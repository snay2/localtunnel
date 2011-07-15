#!/usr/bin/env ruby
require 'localtunnel/tunnel'

# The key file can be provided either on the command line or by finding
# the first *.pub file in the user's .ssh directory
key_file_name = ARGV.first ? ARGV.first : Dir[File.expand_path('~/.ssh/*.pub')].first
key_file = File.open(key_file_name, "rb")
key = key_file.read

# The URL that should be notified when the tunnel is created. In this case, a
# webhook handled by a Kynetx ruleset
app_url = "http://webhooks.kynetxapps.net/h/a163x128.dev/set_tunnel"

# Create and open the tunnel
tunnel = LocalTunnel::Tunnel.new(4567, key, app_url)
tunnel.register_tunnel()
tunnel.start_tunnel()

