class State < ApplicationRecord
  has_paper_trail
  belongs_to :country

end
