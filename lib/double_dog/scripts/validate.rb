module Validate
	def admin_session?(session_id)
	  user = DoubleDog.db.get_user_by_session_id(session_id)
	  user && user.admin?
	end

	def valid_items?(items)
	  items != nil && items.count >= 1
	end

	def valid_username?(username)
	  username != nil && username.length >= 3
	end

	def valid_password?(password)
	  password != nil && password.length >= 3
	end

  def failure(error_name)
    return :success? => false, :error => error_name
  end

  def success(data)
    return data.merge(:success? => true)
  end
end