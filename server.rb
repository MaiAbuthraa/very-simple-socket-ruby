require "socket"

class ServerNode
  attr_reader :socket_path, :server

  def initialize
    puts "==== SERVER NODE ===="

    @socket_path = "/tmp/my.sock"
  end

  def call
    create_socket & waiting
  end

  def waiting
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
  end

  def create_socket
    remove_socket

    #UNIXServer - It creates the socket, saves it to disk,  and lets you monitor it for new connections.
    @server = UNIXServer.new(socket_path)
  end

  def remove_socket
    system("rm #{socket_path}")
  end
end

server = ServerNode.new
server.call
