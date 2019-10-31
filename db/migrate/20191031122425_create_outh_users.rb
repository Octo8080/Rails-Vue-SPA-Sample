class CreateOuthUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :outh_users do |t|
      t.string :name

      t.timestamps
    end
  end
end
