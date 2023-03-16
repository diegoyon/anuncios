class Announcement < ApplicationRecord
  belongs_to :user

  has_many :seen_announcements
  has_many :users, through: :seen_announcements

  validates :content, length: { maximum: 140 }, presence: true

  def custom_time
    if (Time.current - self.created_at) < 1.hour
      "#{((Time.current - self.created_at)/60).round}min" 
    elsif (Time.current - self.created_at) >= 1.hour && (Time.current - self.created_at) < 24.hour
      "#{((Time.current - self.created_at)/3600).round}h" 
    else
      self.created_at.strftime("%d-%m-%y")
    end
  end
end
