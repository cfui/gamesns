class Enduser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # gem refileを使うのに必要な記述
  attachment :profile_image

  has_many :posts, dependent: :destroy
  has_many :enduser_gametags, dependent: :destroy
  accepts_nested_attributes_for :enduser_gametags, allow_destroy: true

  has_many :post_comments, dependent: :destroy

  has_many :dm_messages, dependent: :destroy
  has_many :dm_entries, dependent: :destroy

  validates :nickname, presence: true

end
