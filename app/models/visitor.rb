class Visitor < ApplicationRecord
  validates :email, presence: true, uniqueness: { case_sensitive: false, message: "Votre email a déjà été enregistré !" }

  after_create :subscribe_to_newsletter

  private

  def subscribe_to_newsletter
    SubscribeToNewsletterService.new(self).call
  end
end
