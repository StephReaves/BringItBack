['/campaign/:id', '/campaign/:id/edit'].each do |route|
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
  @campaign.update(params[:campaign])
  redirect "/user/#{current_user.id}"
end

delete '/campaign/:id', auth: :user do |id|
  @campaign.destroy
  redirect "/user/#{current_user.id}"
end
