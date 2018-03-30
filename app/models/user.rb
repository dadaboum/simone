class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  # To activate 1/2 when I want users to be registered on mailchimp
  # after_create :subscribe_to_newsletter

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :hospital

  # To activate 2/2 when I want users to be registered on mailchimp
  # private

  # def subscribe_to_newsletter
  #   SubscribeToNewsletterService.new(self).call
  # end

end
