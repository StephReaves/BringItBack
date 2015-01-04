def current_user
  if session[:user_id]
    @user = User.find(session[:user_id])
  else
    nil
  end
  @user
end

def user_can_edit?(thing)
  current_user && current_user.may_edit(thing)
end
