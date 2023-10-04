class User < ApplicationRecord
    # FIGVAPEBR
    validates :username, presence: true, uniqueness: true
    # validates :password, length:{minimum: 6}


end
