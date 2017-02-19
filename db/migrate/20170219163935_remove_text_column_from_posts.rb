class RemoveTextColumnFromPosts < ActiveRecord::Migration[5.0]
  def change

  	remove_column :posts, :body, :text

  end
end
