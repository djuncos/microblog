class RemoveStringColumnFromPosts < ActiveRecord::Migration[5.0]
  def change

  	remove_column :posts, :body, :string
  end
end
