class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist
         
         validates :email, presence: true, uniqueness: true
         validates :role, presence: true 

         has_many :countries, dependent: :destroy

         after_commit :send_email, on: :create

         private

         def send_email
           UserMailer.welcome_email(self).deliver_now
         end
end
