require 'active_record'

module Honkr
  module Databases
    class SQL

      class User < ActiveRecord::Base
      	has_many :honks # Needed for def get_user_honks(user) method
      end

      # def get_user_honks(user)
      # 	ar_user = User.find(user.id)
      # 	ar_user.honks.map { |x| Honkr::Honk.new }
      # end

      class Honk < ActiveRecord::Base
      	belongs_to :user
      end

      # x = Honkr::Honk.new object to pass into persist_honk
      def persist_honk(honk)
      	ar_honk = Honk.new
      	ar_honk.user_id = honk.user_id
      	ar_honk.content = honk.content
      	ar_honk.save
      	honk.instance_variable_set :@id, ar_honk.id
      end

      def get_honk(id)
      	ar_honk = Honk.find(id)
      	Honkr::Honk.new(ar_honk.id,
      									ar_honk.user_id,
      									ar_honk.content)
      end

# bundle exec rake generate:migration name=CreateHonks
# bundle exec rake generate:migration name=CreateUsers username:string
      def persist_user(user)
      	ar_user = User.new
      	ar_user.username = user.username
      	ar_user.password_digest = user.password_digest
      	ar_user.save
      	user.instance_variable_set :@id, ar_user.id
      end

      def get_user(id)
      	ar_user = User.find(id)
      	Honkr::User.new(ar_user.id,
      									ar_user.username,
      									ar_user.password_digest)
      end

    end
  end
end
