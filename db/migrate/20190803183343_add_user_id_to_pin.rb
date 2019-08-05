class AddUserIdToPin < ActiveRecord::Migration[5.2]
  def change
    add_column :pins, :user_id, :Integer
  end
end
