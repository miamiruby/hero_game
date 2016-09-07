require 'eventmachine'
require 'em-websocket'

socket = new WebSocket("ws://localhost:8080");

socket.onmessage = function(msg){
    console.log(msg.data)
}
