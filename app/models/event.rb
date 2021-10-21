class Event < ApplicationRecord
  validates :action, :event_user_name, :event_type, 
            :event_user_id, :event_id, :event_number, presence: true
end