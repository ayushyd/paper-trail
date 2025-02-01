class Country < ApplicationRecord
   has_paper_trail
  belongs_to :user
  has_many :states, dependent: :destroy
  
  encrypts :name,deterministic: true


   def safe_name
       begin
         self.name
       rescue ActiveRecord::Encryption::Errors::Decryption => e
         Rails.logger.error "Decryption error for user ##{self.id}: #{e.message}"
         "Decryption failed"
       end
   end

end
