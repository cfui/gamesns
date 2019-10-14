class DmRoom < ApplicationRecord
	has_many :dm_messages
	has_many :dm_entries
end
