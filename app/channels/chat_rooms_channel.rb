class ChatRoomsChannel < ApplicationCable::Channel 
	def subscribed
		stream_from "chat_rooms_#{params['chat_room_id']}_channel"
	end

	def unsubscribed
		#any cleanup needed when channel is subscribed
	end

	def send_message(data)
		#process data sent from the page
		current_user.messages.create!(body: data['message'], chat_room_id: data['chat_room_id']) if ChatRoom.exists?(id: data['chat_room_id'])
	end
end