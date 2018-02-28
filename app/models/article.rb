#
class Article < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  def should_generate_new_friendly_id?
 	title_changed?
  end
  # isso indica a relacao no banco de 1 article para muitos comentarios
  # e ainda, toda vez que um post for deletado,
  # os comentarios tb serao -> dependent
  has_many :comments, dependent: :destroy
  # o titulo deve existir (presence) e ter no maximo 50 caracteres (lenth)
  validates :title, presence: true, length: { maximum: 50 }
  validates :text, presence: true, length: { maximum: 500 }
end
