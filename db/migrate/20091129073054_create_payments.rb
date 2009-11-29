class CreatePayments < ActiveRecord::Migration
  def self.up
    create_table :payments do |t|
      t.column  :product_id,  :integer
      t.column  :amount,  :float
      t.column  :pay_method,  :integer
      t.column  :pay_at,  :datetime
      t.column  :pay_man, :string
      t.column  :desc,  :text
      t.timestamps
    end
  end

  def self.down
    drop_table :payments
  end
end
