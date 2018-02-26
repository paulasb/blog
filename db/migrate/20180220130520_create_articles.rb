#
class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :text

      t.timestamps
      
      extend FriendlyId
	  friendly_id :title, use: :slugged
    end
  end
end
