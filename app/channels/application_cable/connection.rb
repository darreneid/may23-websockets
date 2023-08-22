module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :client_id

    def connect
      # invoked upon new client-server connection
      # initialize identifying information (current_user)
      self.client_id = (1..1000).to_a.sample
      puts "client #{client_id} connected!"
    end

    def disconnect
      puts "client #{client_id} disconnected..."
    end
  end
end
