class User < ApplicationRecord
    # FIGVAPEBR
    validates :username, :session_token, presence: true, uniqueness: true
    validates :password_digest, presence: true
    # validates :password, length:{minimum: 6}


end
