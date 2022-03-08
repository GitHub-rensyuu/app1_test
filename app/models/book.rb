class Book < ApplicationRecord

  # title,bodyが空の時trueにする
  validates :title, presence: true
  validates :body, presence: true
end
