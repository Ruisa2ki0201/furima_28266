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
          end

            REGEX = /\A[ァ-ヶー－]+\z/.freeze
            validates_format_of :phonetic_surname, with: REGEX, message: 'は全角カタカナのみで入力してください'
            validates_format_of :phonetic_name, with: REGEX, message: 'は全角カタカナのみで入力してください'
            
            PASSWORD_REGEX = /\A[a-zA-Z0-9]+\z/.freeze
            validates_format_of :password, with: PASSWORD_REGEX, message: 'は半角英数字混合であること'
            validates_format_of :password_confirmation, with: PASSWORD_REGEX, message: 'は半角英数字混合であること'
            
            validates :email,uniqueness: true
            validates_uniqueness_of:nickname,case_sensitive: true
            
          
end
