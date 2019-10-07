class Post < ApplicationRecord
  belongs_to :enduser

  # gem refileを使うのに必要な記述
  attachment :post_image
end
