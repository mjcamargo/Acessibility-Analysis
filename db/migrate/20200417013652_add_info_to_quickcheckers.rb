class AddInfoToQuickcheckers < ActiveRecord::Migration[5.0]
  def change
    add_column :quickcheckers, :info, :string
  end
end
