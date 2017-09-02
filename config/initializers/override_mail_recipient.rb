if ENV['IS_STAGING'] == 'true'
  class OverrideMailRecipient
    def self.delivering_email(mail)
      mail.subject = "[STAGING] | #{mail.subject}"
      mail.to = AdminEmails.list, 'currents-dev@mailinator.com'
    end
  end
  ActionMailer::Base.register_interceptor(OverrideMailRecipient)
end
