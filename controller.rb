require('sinatra')
require('sinatra/contrib/all')
require_relative('controllers/members_controller')
require_relative('controllers/bookclass_controller')
require_relative('controllers/gymclass_controller')
require("pry")

get '/' do
  erb(:home)
end
