randomize()
show_debug_message("created")
global.sendCode = false;
role = ""

global.socket = network_create_socket(network_socket_udp);//no port since the client doesn’t care
//Server IP and port, needed to send packets

remote_port = 8000;
//Make a buffer to hold packet data
send_buffer = buffer_create(1024,buffer_fixed,1);


code_received = []
buffer_write(send_buffer, buffer_u8,1); //id. Use different ones for different msg types

var roles = irandom(1);
if (roles == 0){
role = "maker"
buffer_write(send_buffer, buffer_string,"breaker");
}
else{
role = "breaker"
buffer_write(send_buffer, buffer_string,"maker");
}

var connect = network_send_udp(global.socket,global.ip_address,remote_port,send_buffer,buffer_tell(send_buffer));

if (connect < 0){
show_error("Not Connected",true);
}
