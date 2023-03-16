class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :announcements

  has_many :seen_announcements
  has_many :announcements, through: :seen_announcements

  def full_name
    "#{name} #{last_name}"
  end
end
