class CreateComments < ActiveRecord::Migration[7.2]
  def change
    create_table :comments do |t|
      t.string :content
      t.string :author_name

      t.timestamps
    end
  end
end
