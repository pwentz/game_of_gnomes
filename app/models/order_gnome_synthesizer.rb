class OrderGnomeSynthesizer
  class << self
    def generate_order_gnomes(session_contents)
      current_user = current_user(session_contents["user_id"])
      session_contents['bucket'].each do |gnome_id, quantity|
        most_recent_order(current_user).order_gnomes.create(
          gnome_id: gnome_id.to_i,
          quantity: quantity
        )
      end
    end

    def current_user(user_id)
      User.find(user_id)
    end

    def most_recent_order(user)
      user.orders.last
    end
  end
end
