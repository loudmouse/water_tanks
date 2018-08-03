class DropFriendlyIdSlugsTable < ActiveRecord::Migration[5.1]
  def up
    drop_table :friendly_id_slugs
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
