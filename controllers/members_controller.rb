require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/members.rb' )

also_reload( '../models/*' )

get '/members' do
  @members = Member.all()
  erb (:"member/index")
end

get '/members/new' do
  @members = Member.all()
  erb(:"member/new")
end

get '/members/:id' do
  @members = Member.find(params[:id])
  erb(:"member/show")
end

post '/members' do
  Member.new(params).save
  redirect to '/members'
end

get '/members/:id/edit' do
  @members = Member.find(params[:id])
  erb(:"member/edit")
end

post '/members/:id' do
  Member.new(params).update
  redirect to "/members/#{params['id']}"
end

post '/members/:id/delete' do
  Member.delete( params[:id])
  redirect to '/members'
end

get '/members/:id/booking' do
  @members = Member.find(params[:id])
  @gym_classes = @members.booked_classes()
  erb (:"member/bookings")
end

post '/members/:member_id/booking' do
  booking = Booking.new(params)
  booking.save()
  redirect to "/members/#{params['member_id']/bookings}"
end
