class DmMessage < ApplicationRecord
	belongs_to :enduser
	belongs_to :dm_room
	
	default_scope -> { order(created_at: :desc) }
end
