class UserMailer < ApplicationMailer

def registration_confirmation(user_id)
    user = User.find(user_id)
    subject = "Welcome to our awesome app!"
    merge_vars = {
      "FIRST_NAME" => user.first_name,
      "USER_URL" => user_url(user),
    }
    body = mandrill_template("Registration", merge_vars)

    send_mail(user.email, subject, body)
  end
end


end
