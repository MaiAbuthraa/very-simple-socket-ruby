require "socket"

class ClientNode
  attr_reader :socket_path, :socket

  def initialize
    puts "==== Client NODE ===="

    @socket_path = "/tmp/my.sock"
  end

  def call
    open_socket & write
  end

  def open_socket
    #UNIXSocket - Open existing sockets for IO
    @socket = UNIXSocket.new(socket_path)
  end

  def write
    puts "Wirte Something :"

    loop do
      print ">>> "
      message = gets
      socket.write(message)
    end
  end

end

client = ClientNode.new
client.call

