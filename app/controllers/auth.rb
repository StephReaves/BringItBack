get '/' do
  @campaigns = Campaign.all
  erb :'index'
end

get '/login' do
  erb :'/auth/login'
end

post  '/login' do
  user = User.find_by(username: params[:user][:username]).try(:authenticate, params[:user][:password])

  if user
    session[:user_id] = user.id
    redirect '/'
  else
    set_error "Please check your password and username"
    redirect '/login'
  end
end

post '/login' do

  redirect'/'
end

get '/signup' do
  erb :'/auth/signup'
end

post '/signup' do
  user = User.new(params[:user])

  if user.save
    session[:user_id] = user.id
    redirect '/'
  else
    set_error "Pick another name, password, or valid email"
    redirect "/signup?name=#{params[:user][:username]}"
  end

end

get '/logout' do
  session[:user_id] = nil
  redirect '/'

end
