# frozen_string_literal: true

class Raffle < ApplicationRecord
  validates :name, presence: true
end
