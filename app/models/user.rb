class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable

  belongs_to :raffle

  validates_uniqueness_of :email, case_sensitive: true, uniqueness: { scope: :raffle }
end
