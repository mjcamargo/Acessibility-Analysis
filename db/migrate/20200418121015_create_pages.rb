class CreatePages < ActiveRecord::Migration[5.0]
  def change
    create_table :pages do |t|
      t.string :guideline

      t.timestamps
    end
  end
end
