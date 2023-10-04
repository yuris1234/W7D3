class ChangeUserTable < ActiveRecord::Migration[7.0]
  def change
    add_index :users, :session_token, unique: true
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
    #Ex:- add_index("admin_users", "username")
  end
end
