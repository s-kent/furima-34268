class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #has_many :products
  #has_many :comments
  #has_many :purchase_managements

  with_options presence: true do
    validates :nickname
    validates :email
    validates :birthday

    with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ } do
      validates :first_name
      validates :last_name
    end
  
    with_options format: { with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/ } do
      validates :first_name_kana
      validates :last_name_kana
    end
  end  
  
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX
end

 