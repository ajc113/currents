class AdminEmails
  def self.list
    AdminUser.all.map do |user|
      user.email
    end
  end
end
