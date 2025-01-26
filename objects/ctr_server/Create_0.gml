///Initialise the server object

role = ""

code_received = []
global.sendCode = false;
var port = 8000;
global.socket = network_create_socket_ext(network_socket_udp,port);
//Placeholders
remote_port = 0;
remote_ip = "127.0.0.1";
//Make a buffer to hold packet data
send_buffer = buffer_create(2048,buffer_fixed,1);

