['/campaign/:id', '/campaign/:id/edit', '/campaign/:id/vote'].each do |route|
  before route do |id|
    @campaign = Campaign.find(id)
  end
end

get '/campaigns' do
  @campaigns = Campaign.all

  erb :'/campaign/all'
end

get '/campaigns/new' do
  erb :'campaign/_new_form'
end

#new campaign
post '/campaigns', auth: :user do
  params[:campaign][:user_id] = current_user.id
  campaign = Campaign.create(params[:campaign])
  redirect "/user/#{current_user.id}"
end


get '/campaign/:id' do |id|
  @comments = Comment.where(campaign_id: @campaign.id)
  erb :'/campaign/single'
end

get '/campaign/:id/edit', auth: :user do |id|
  erb :'/campaign/_update_form', locals: {campaign: @campaign}
end

#update campaign
put '/campaign/:id', auth: :user do |id|
  if current_user.may_edit(@campaign)
    @campaign.update(params[:campaign])
    redirect "/campaign/#{@campaign.id}"
  else
    set_error "You may not edit this"
    redirect "/campaign/#{@campaign.id}"
  end
end

delete '/campaign/:id', auth: :user do |id|
  @campaign.destroy
  redirect "/user/#{current_user.id}"
end

#voting tb added if there is enough time
# post '/campaign/:id/vote', auth: :user do |id|
#   unless @campaign.vote(current_user)
#     set_error "You have voted on this already"
#   end

#   if request.xhr?

#   else
#   end

# end
