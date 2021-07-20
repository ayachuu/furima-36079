class CreateRetailers < ActiveRecord::Migration[6.0]
  def change
    create_table :retailers do |t|

      t.timestamps
    end
  end
end
