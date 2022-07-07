class AddImgUrlToPeople < ActiveRecord::Migration[7.0]
  def change
    add_column :people, :img_url, :string
  end
end
