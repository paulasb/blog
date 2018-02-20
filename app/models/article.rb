#
class Article < ApplicationRecord
  # o titulo deve existir (presence) e ter no maximo 50 caracteres (lenth)
  validates :title, presence: true, length: { maximum: 50 }
end
