require "sinatra"
require "sinatra/activerecord"
require "sinatra/flash"
require "./models"


set :database, "sqlite3:test.sqlite3"

enable :sessions




get '/sign-in' do
	erb :"sign-in"
end


post '/sign-in' do     
	puts "my params are" + params.inspect

	@user = User.where(username: params[:username]).first
	session[:user_id] = @user.id
	if @user.password == params[:password]
		flash[:notice] = "Successfully logged in."
     	redirect '/'   
	else
		redirect '/login-failed'
	end
	   
end

get '/login-failed' do
	erb :"login-failed"
end

get "/" do
	if session[:user_id]       
		@current_user = User.find(session[:user_id])     
	end
	@username = @current_user.username
	@posts = Post.all
	erb :index
end

post '/posts' do
	@user = User.find(session[:user_id])
	@post = Post.new(params[:post])
	Post.create(user_id: @user.id, title: @post.title, body: @post.body)
	puts "my params are" + params.inspect
	redirect '/' 

end








# methods

def date_method(time)
   time.strftime("%d %b %Y")
end