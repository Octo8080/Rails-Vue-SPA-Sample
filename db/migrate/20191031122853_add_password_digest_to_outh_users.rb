class AddPasswordDigestToOuthUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :outh_users, :password_digest, :string
  end
end
