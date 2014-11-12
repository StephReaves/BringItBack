['/campaign/:id'].each do |route|
  before route do |id|
    @campaign = Campaign.find(id)
  end
end

get '/campaign' do

end

get '/campaign/:id' do |id|
  erb :'/campaign/single'
end
