class CreateAssetsSharesTable < ActiveRecord::Migration
  def self.up
    create_table :assets_shares do |t|
      t.references :shareable, :polymorphic => true
      t.references :asset
    end
    add_index :assets_shares, :shareable_id
    add_index :assets_shares, :shareable_type
  end

  def self.down
    remove_index :assets_shares, :shareable_id
    remove_index :assets_shares, :shareable_type
    drop_table :assets_shares
  end
end