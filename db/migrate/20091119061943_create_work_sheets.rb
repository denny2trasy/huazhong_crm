class CreateWorkSheets < ActiveRecord::Migration
  def self.up
    create_table :work_sheets do |t|
      t.column  :user_id,   :integer    # 工单负责人
      t.column  :product_id,  :integer      
      t.column  :task,  :text   # 工作要求
      t.column  :expected_at,  :datetime  # 期望完成时间
      t.column  :content, :text   # 完成者说明
      t.column  :finished_at, :datetime
      t.timestamps
    end
  end

  def self.down
    drop_table :work_sheets
  end
end
