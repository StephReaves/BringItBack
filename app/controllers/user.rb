get '/user/:id' do |id|
  @campaigns = Campaign.where(user_id: id)
  @user = User.find(id)

  erb :'/campaign/all'
end
