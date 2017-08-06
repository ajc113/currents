class DeviseCustomMailer < Devise::Mailer
  	helper :application
  	default template_path: 'devise/mailer'
  	layout 'mailer'
  	# add_template_helper EmailHelper
  	add_template_helper ApplicationHelper
  	default from: 'Fishing Network <intel@thefishing.network>'
		default to: "currentsfishingnetwork@gmail.com"

require "mandrill"

  def mandrill_template(template_name, attributes)
    mandrill = Mandrill::API.new(ENV['MANDRILL_API_KEY'])

    merge_vars = attributes.map do |key, value|
      { name: key, content: value }
  end

# new 
  
  def confirmation_instructions(record, token, opts={})
       options = {
      :subject => "Password Reset",
      :email => record.email,
      :global_merge_vars => [
        {
          name: "password_reset_link",
          content: "http://www.example.com/users/password/edit?reset_password_token=#{token}"
        }
      ],
      :template => "registration"
    }
    mandrill_send options  
  end

  def mandrill_send(opts={})
    message = { 
      :subject=> "#{opts[:subject]}", 
      :from_name=> "example corp",
      :from_email=>"example@somecorp.com",
      :to=>
            [{"name"=>"Some User",
                "email"=>"#{opts[:email]}",
                "type"=>"to"}],
      :global_merge_vars => opts[:global_merge_vars]
      }
    sending = MANDRILL.messages.send_template opts[:template], [], message
    rescue Mandrill::Error => e
      Rails.logger.debug("#{e.class}: #{e.message}")
      raise
  end

private



  # def send_mail(email, subject, body)
  #   mail(to: email, subject: subject, body: body, content_type: "text/html")
  # end







 end

end


