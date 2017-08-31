module CardHelper
  def subscription_status
    if current_user.subscription_id.nil?
      'N/A'
    else
      @subscription.try(:status)
    end
  end

  def subscription_instruction_should_be_shown?
    if current_user.trial_running? && current_user.payment_source.nil?
      true
    elsif current_user.does_not_have_active_subscription?
      true
    end
  end
end
