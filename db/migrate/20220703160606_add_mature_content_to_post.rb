class AddMatureContentToPost < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :mature_content, :boolean
  end
end
