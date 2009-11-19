class CreateWorkshops < ActiveRecord::Migration
  def self.up
    create_table :workshops do |t|
      t.column  :name,  :string
      t.column  :desc,  :text
      t.column  :user_id, :integer    #车间负责人
      t.timestamps
    end
  end

  def self.down
    drop_table :workshops
  end
end
