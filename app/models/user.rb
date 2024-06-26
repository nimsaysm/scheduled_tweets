# DB fields: 
# email:string
# password_digest:string (password after bcrypt)

# virtual atributes:
# password:string
# password_confirmation:string

class User < ApplicationRecord
    has_many :twitter_accounts, dependent: :destroy
    has_many :tweets

    has_secure_password
    
    validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/ , message: "must be a valid email address" }
end
