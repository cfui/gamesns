class EnduserGametag < ApplicationRecord
	belongs_to :enduser
	belongs_to :game_tag
end
