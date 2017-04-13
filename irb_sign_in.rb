app.get '/users/sign_in'
csrf_token = app.session[:_csrf_token]

app.post('/users/sign_in', { "authenticity_token" => csrf_token, "user" => { "email" => "tannakartikey@gmail.com", "password" => "password" } })

@current_user = app.controller.current_user
