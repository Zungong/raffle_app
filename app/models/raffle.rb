class Raffle < ApplicationRecord
  validates :name, presence: true
end
