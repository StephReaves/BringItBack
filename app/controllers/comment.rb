['/comment/:id', '/comment/:id/edit'].each do |route|
  before route do |id|
    @comment = Comment.find(id)
  end
end

get '/comments' do
  @comment = Comment.all
  erb :'comment/all'
end
get '/comments/new' do
  erb :'/comment/_new_form'
end

post '/comments' do
  params[:comment][:user_id] = current_user.id
  @comment = Comment.create(params[:comment])

  if request.xhr?
    erb :'comment/single', locals: {comment: @comment}, layout: false
  else
    redirect "/campaign/#{comment.campaign.id}"
  end
end

get '/comment/:id/edit', auth: :user do |id|
  erb :'/campaign/_update_form', locals: {comment: @comment}
end

put '/comment/:id', auth: :user do |id|
  @comment.update(params[:comment)
  redirect "/campaign/#{comment.campaign.id}"
end

delete '/comment/:id', auth: :user do |id|
  @comment.destroy
  redirect "/campaign/#{comment.campaign.id}"
end
