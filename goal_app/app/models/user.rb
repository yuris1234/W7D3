class User < ApplicationRecord
    # FIGVAPEBR
    before_validation :ensure_session_token
    validates :username, :session_token, presence: true, uniqueness: true
    validates :password_digest, presence: true
    validates :password, length:{minimum: 6}

    attr_reader :password




    def is_password?(password)
        BCrypt::Password.new(self.password_digest).is_password?(password)
    end

    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end

    def self.find_by_credentials(username, password)
        @user = User.find_by(username: username)
        # debugger
        if @user && @user.is_password?(password)
            @user
        else
            nil
        end
    end

    def ensure_session_token
        self.session_token ||= generate_unique_session_token
    end

    private

    def generate_unique_session_token
        SecureRandom::urlsafe_base64
    end
end
