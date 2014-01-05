class DeviseCreateUsers < ActiveRecord::Migration
  def change
    create_table(:users) do |t|
      ## Trackable
      t.integer  :sign_in_count, :default => 0, :null => false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      ## Omniauthable
      t.integer  :uid, limit: 8
      t.string   :name
      t.string   :provider
      t.string   :password


      t.timestamps
    end

    add_index :users, :uid,                :unique => true
    #add_index :users, :email,                :unique => true
    #add_index :users, :reset_password_token, :unique => true
    # add_index :users, :confirmation_token,   :unique => true
    # add_index :users, :unlock_token,         :unique => true
  end
end
