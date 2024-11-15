class CreatePosts < ActiveRecord::Migration[7.2]
  def change
    create_table :posts do |t|
      t.string :category
      t.string :title
      t.string :content

      t.timestamps
    end
  end
end
