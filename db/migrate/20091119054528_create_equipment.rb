class CreateEquipment < ActiveRecord::Migration
  def self.up
    create_table :equipment do |t|
      t.column  :name,  :string
      t.column  :user_id, :integer  # 机床负责人
      t.column  :workshop_id, :integer  # 所属车间
      t.column  :class, :string
      t.column  :buy_at,  :string
      t.column  :from,    :string
      t.column  :desc,  :text
      t.timestamps
    end
  end

  def self.down
    drop_table :equipment
  end
end
