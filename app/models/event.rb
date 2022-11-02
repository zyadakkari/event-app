class Event < ApplicationRecord

    belongs_to :creator, :class_name => 'User', :foreign_key => 'creator_id'
    has_many :event_users
    has_many :attendees, through: :event_users, source: :user
end
