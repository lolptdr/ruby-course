module Honkr
  class SignIn

    def self.run(params)
      # TODO, note: params hash contains :username and :password
      if params[:username].empty? || params[:password].empty?
        return {:success? => false, :error => "Blank entries!"}
      end

      user = Honkr.db.get_user_by_username(params[:username])
      return {:success? => false, :error => "No such user!"} if !user

      if user.has_password?(params[:password])
      	session_id = Honkr.db.create_session({:user_id => user.id})
      	return {:success? => true, :session_id => session_id}
      else
      	return {:success? => false, :error => :invalid_password}
      end

      # Another way:
      # if !user.has_password?(params[:password])
      # 	return {success?: false, error: :invalid_password}
      # end

      # session = Honkr.db.create_session(user_id: user.id)

      # {
      # 	success?: true,
      # 	session_id: session
      # }

    end

  end
end