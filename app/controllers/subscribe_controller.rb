class SubscribeController < ApplicationController
  def create
    gibbon = Gibbon::Request.new(api_key: ENV['MAILCHIMP_KEY'], debug: true)
    begin
      gibbon.lists(ENV["MAILCHIMP_LIST_ID"]).members.create(body: {
        email_address: params[:email],
        status: "pending"
      })
      render json: { 'success': "Please check your mailbox to finish the process." }
    rescue Gibbon::MailChimpError => e
      puts e.class
      puts e.raw_body.class
      puts JSON.parse(e.raw_body)['detail']
      render json: { error: JSON.parse(e.raw_body)['detail'] }, status: :bad
    end
  end
end
