class Plan < ActiveRecord::Base
  has_many :users

  def self.active
    where(active: true)
  end
end
