class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :created_events, :foreign_key => 'creator_id', :class_name => 'Event', dependent: :delete_all
  has_many :event_users, dependent: :delete_all
  has_many :attended_events, through: :event_users, source: :event, dependent: :delete_all

  validates :name, presence: true, length: { minimum: 2 }

end
