class CreateMaterials < ActiveRecord::Migration
  def self.up
    create_table :materials do |t|
      t.column  :name,  :string
      t.column  :type,  :string    #第一级类别 配件 耗材
      t.column  :class, :integer    #第二级类别 配件（瓦 活塞 缸体 气门 导管） 耗材（螺钉）
      t.column  :sub_class, :integer    #第三级类别 瓦的子类别 主轴 连杆
      t.column  :diameter,  :float     #直径尺寸 0.25 0.5 0.75 1.0     
      t.column  :desc,  :text
      t.timestamps
    end
  end

  def self.down
    drop_table :materials
  end
end
