class RenameShopNameColumnToFlorists < ActiveRecord::Migration[6.0]
  def change
    rename_column :florists, :shop_name, :name
  end
end
