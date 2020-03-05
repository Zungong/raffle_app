# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Model relations' do
    it { is_expected.to belong_to(:raffle) }
  end
end
