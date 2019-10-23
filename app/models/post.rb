class Post < ApplicationRecord
  belongs_to :enduser
  has_many :post_comments, dependent: :destroy

  # gem refileを使うのに必要な記述
  attachment :post_image

  default_scope -> { order(created_at: :desc) }
  validates :postbody, presence: true
end
