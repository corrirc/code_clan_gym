require( 'sinatra' )
require( 'sinatra/contrib/all' )
require('pry')
require_relative( '../models/gymclass.rb' )

also_reload( '../models/*' )

get '/gym_classes/:id/book_class' do
  @gym_class = GymClass.find(params[:id])
  @members = Member.all()
  erb (:"gym_class/bookings")
end

get '/gym_classes/:id/members' do
  @gym_class = GymClass.find(params['id'])
  erb (:"gym_class/members")
end

get '/gym_classes/:id/edit' do
  @gym_class = GymClass.find(params[:id])
  erb(:"gym_class/edit")
end

get '/gym_classes/new' do
  @gym_classes = GymClass.all()
  erb(:"gym_class/new")
end

get '/gym_classes' do
  @gym_classes = GymClass.all()
  erb (:"gym_class/index")
end

get '/gym_classes/:id' do
  @gym_class = GymClass.find(params[:id])
  erb(:"gym_class/show")
end

post '/gym_classes' do
  GymClass.new(params).save
  redirect to '/gym_classes'
end

post '/gym_classes/:id' do
  GymClass.new(params).update
  redirect to "/gym_classes/#{params['id']}"
end

post '/gym_classes/:id/delete' do
  GymClass.delete( params[:id])
  redirect to '/gym_classes'
end

get '/gym_classes/:id/bookings' do
  @members = Member.all
  @gym_class_id = params[:id]
  erb(:"bookclass/new")
end

post '/gym_classes/:gym_class_id/bookings' do
  booking = BookClass.new(params)
  booking.save()
  redirect to "gym_classes/#{params['gym_class_id']}/bookings"
end
