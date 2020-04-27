class CreateQuickcheckers < ActiveRecord::Migration[5.0]
  def change
    create_table :quickcheckers do |t|
      t.string :url1
      t.string :url2
      t.string :url3

      t.timestamps
    end
  end
end
