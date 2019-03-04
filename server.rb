require "socket"

#remove socket
system("rm /tmp/my.sock")

puts "+++ SERVER NODE +++"

#UNIXServer - It creates the socket, saves it to disk,  and lets you monitor it for new connections.
server = UNIXServer.new('/tmp/my.sock')
puts "==== Waiting for connection ===="


loop do
  #"This call typically blocks until a client connects with the server."
  Thread.start(server.accept) do |client|
    puts "A new client connect with `my.sock`, Server will start receiving  messages"

    while (client_message = client.readline)
      puts "Client : #{client_message}"
    end
  end
end
