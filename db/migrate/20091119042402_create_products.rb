class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.column  :name,  :string
      t.column  :desc,  :text
      t.column  :customer_name,  :string
      t.column  :customer_phone,  :string
      t.column  :class,   :integer    # 缸体 曲轴 ... 字典表维护
      t.column  :user_id, :integer    # 负责人
      t.column  :predict_fee, :float
      t.column  :started_at,  :datetime   #到货日期
      t.column  :finished_at, :datetime   #交货日期
      t.column  :fee, :float
      t.column  :paid_at, :datetime   #付费日期
      t.column  :register_id, :integer    # 登记人
      t.timestamps
    end
    add_index :products,  :user_id
  end

  def self.down
    drop_table :products
  end
end
