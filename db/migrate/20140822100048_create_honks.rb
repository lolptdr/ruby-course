class CreateHonks < ActiveRecord::Migration
  def change
    create_table :honks do |t|
    	t.belongs_to :user
    	t.string :content
    end
  end
end
