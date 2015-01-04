['/comment/:id', '/comment/:id/edit', '/comment/:id/vote'].each do |route|
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
    redirect "/campaign/#{@comment.campaign.id}"
  end
end

get '/comment/:id/edit' do |id|
  erb :'/comment/_update_form', locals: {comment: @comment}
end

put '/comment/:id', auth: :user do |id|
  if current_user.may_edit(@comment)
    @comment.update(params[:comment])
    redirect "/campaign/#{@comment.campaign.id}"
  else
    set_error "You may not edit this"
    redirect "/campaign/#{@comment.campaign.id}"
  end
end

delete '/comment/:id' do |id|
  @comment.destroy
  redirect "/campaign/#{@comment.campaign.id}"
end

#voting
post '/comment/:id/vote' do |id|
  unless @comment.vote(current_user)
    set_error "You have voted on this already"
  end

  if request.xhr?
    return {score: @comment.score}.to_json
  else
    redirect "/campaign/#{@comment.campaign.id}"
  end

end

