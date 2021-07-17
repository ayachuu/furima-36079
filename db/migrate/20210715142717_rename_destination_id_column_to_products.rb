class RenameDestinationIdColumnToProducts < ActiveRecord::Migration[6.0]
  def change
    rename_column :products, :destination_id, :delivery_destination_id
  end
end
