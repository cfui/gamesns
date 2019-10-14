class DmEntry < ApplicationRecord
	belongs_to :enduser
	belongs_to :dm_room
end
