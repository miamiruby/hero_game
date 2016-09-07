require 'eventmachine'
require 'em-websocket'

puts 'Starting Game Server'

module GameServer

  def add_player player
    # if partner is available
    #   pair_up with partner
    # else
    #   enqueue partner
  end

  def pair_up player, partner
    # create a new game
    # appoint one of the player as first, and start the game
  end

  def start_game
    send_data "Your quest begins now! You have 0 Gold
"
  end

  def end_game
    send_data "Running away are you?
"
    close_connection
  end

  def help
     send_data "/quit\" to exit"
  end

  def post_init
     send_data "
Welcome to Hero Questalot!
"
     send_data "Type \"/help\" to see a list of commands or \"\/quit\" to exit

"
     send_data ">>> "
     puts "A new hero comes to seek his fortune!"
  end

   def receive_data data
     send_data ">>>you sent: #{data}"

     if data =~ /\/quit/i
       end_game
     end

     if data =~ /\/help/i
       help
     end

     #close_connection if data =~ /quit/i

   end

   def unbind
     puts "Our Hero has run away from a fight!"
   end
end

EventMachine.run {
  EventMachine.start_server "0.0.0.0", 8080, GameServer
}
