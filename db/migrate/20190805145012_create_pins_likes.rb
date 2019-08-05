class CreatePinsLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :user_likes, :id => false do |t|
      t.belongs_to :user, index: true
      t.belongs_to :like, index: true
    end
  end
end
