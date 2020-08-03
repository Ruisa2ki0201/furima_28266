class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         with_options presence: true do
           validates :nickname
           validates :birthday
           validates :surname
           validates :name
           validates :phonetic_surname
           validates :phonetic_name
           validates :phonetic_surname, format: {with:/\A[ァ-ヶー－]+\z/,message: "は全角カタカナのみで入力してください"}
           validates :phonetic_name, format: { with:/\A[ァ-ヶー－]+\z/, message: "は全角カタカナのみで入力してください"}
           validates :password, format: { with:/\A[a-zA-Z0-9]+\z/,message: "は半角英数字混合であること"}
           validates :password_confirmation, format: { with:/\A[a-zA-Z0-9]+\z/,message: "は半角英数字混合であること"}
          end

            validates :email,uniqueness: true
            validates_uniqueness_of :nickname,case_sensitive: true
            
          
end
