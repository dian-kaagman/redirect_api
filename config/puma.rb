if (/darwin/ =~ RUBY_PLATFORM) == nil
    bind "unix:///var/run/sockets/redirect_api.production.socket"
    daemonize true
   else
    port ENV.fetch("PORT") { 3000 }
   end
   environment ENV.fetch("RAILS_ENV") { "development" }
   pidfile 'tmp/pids/server.pid'

plugin :tmp_restart
