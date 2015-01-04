class CreateCampaigns < ActiveRecord::Migration
  def change
     create_table :campaigns do |t|
      t.string :title
      t.text :what
      t.text :why

      t.references :user

      t.timestamps
    end
  end
end
