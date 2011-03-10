class CreatePaydayTables < ActiveRecord::Migration
  def self.up
    create_table :<%= invoice_name.pluralize.underscore.split("/").last %> do |t|
      # invoices will work without anything but bill_to, but there are quite a few options for the fields you can save, like ship_to
      # due_at, and paid_at
      t.string :bill_to

      t.timestamps
    end

    create_table :<%= line_item_name.pluralize.underscore.split("/").last %> do |t|
      t.decimal :price
      t.string :description
      t.integer :quantity     # can also be :decimal or :float - just needs to be numeric

      t.references :<%= invoice_name.underscore %>

      t.timestamps
    end
  end
  
  def self.down
    drop_table :<%= invoice_name.pluralize.underscore.split("/").last %>
    drop_table :<%= line_item_name.pluralize.underscore.split("/").last %>
  end
end