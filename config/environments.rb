require 'active_record'

if ENV['APP_ENV'] == 'development'
  Honkr.db = Honkr::Databases::SQL.new
else
  Honkr.db = Honkr::Databases::InMemory.new
end

# TODO: ESTABLISH ACTIVE RECORD CONNECTION
# Maker sure you are setting this to the correct database!!
ActiveRecord::Base.establish_connection(
  :adapter => 'postgresql',
  :database => 'honkr-2_dev'
)



# Alternative way to do this, to account for dev and test environments:
# if ENV['APP_ENV'] == 'development'
#   Honkr.db = Honkr::Databases::SQL.new
#   ActiveRecord::Base.establish_connection(
#     :adapter => 'postgresql',
#     :database => 'honkr-2_dev'
#   )
# else
#  # Not needed actually: Honkr.db = Honkr::Databases::InMemory.new
#   ActiveRecord::Base.establish_connection(
#     :adapter => 'postgresql',
#     :database => 'honkr-2_test'
#   )
# end