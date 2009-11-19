class CreateBrands < ActiveRecord::Migration
  def self.up
    create_table :brands do |t|
      t.column  :name, :string    #品牌 桑塔纳 尼桑 等
      t.column  :style, :string    #型号 2000 与品牌关联
      t.column  :capacity,  :integer    #排量 1.8 2.4 3.8
      t.column  :desc,  :text
      t.timestamps
    end
  end

  def self.down
    drop_table :brands
  end
end
