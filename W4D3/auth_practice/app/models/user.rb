# == Schema Information
#
# Table name: users
#
#  id              :bigint(8)        not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
    attr_reader :password

    validates :username, :session_token, presence: true
    validates_presence_of :password_digest, message: "Password can't be blank"
    validates :password, length: {minimum: 6, allow_nil: true}

    before_validation :ensure_session_token

    def self.find_by_credentials(username, password)
        User.find_by(username: username, password_digest: BCrypt::Password.create(password))
    end

    def self.generate_session_token
        SecureRandom::urlsafe_base64
    end

    def reset_session_token!
        self.session_token ||= User.generate_session_token
        self.save!
    end

    def ensure_session_token
        self.session_token ||= User.generate_session_token
    end

    def password=(pw)
        @password = pw
        self.password_digest = BCrypt::Password.create(password)
    end
end
