class AddFileToQuickchecker < ActiveRecord::Migration[5.0]
  def change
    add_column :quickcheckers, :file, :string
  end
end
