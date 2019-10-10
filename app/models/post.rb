class Post < ApplicationRecord
  belongs_to :enduser
  has_many :enduser_gametags
  has_many :post_comments

  # gem refileを使うのに必要な記述
  attachment :post_image
end
