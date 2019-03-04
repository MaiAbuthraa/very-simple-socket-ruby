require "socket"

#UNIXSocket - Open existing sockets for IO
socket = UNIXSocket.new('/tmp/my.sock')

puts "Wirte Something :"

loop {
  print ">>> "
  message = gets
  socket.write(message)
}
