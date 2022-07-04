class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.references :person, null: false, foreign_key: true
      t.references :pokemon, null: false, foreign_key: true
      t.string :content

      t.timestamps
    end
  end
end
