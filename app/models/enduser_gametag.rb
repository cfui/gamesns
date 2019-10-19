class EnduserGametag < ApplicationRecord
	belongs_to :enduser
	validates :tag_name, presence: true
end
