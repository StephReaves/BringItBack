def set_error(error)
  session[:error] = error
end

def display_error
  if session[:error]
    error = session[:error]
    session[:error] = nil
    return "<h1><p>Error: #{error}</p></h1>"
  end
end
