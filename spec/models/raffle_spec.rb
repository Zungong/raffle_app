require 'rails_helper'

RSpec.describe Raffle, type: :model do
  describe 'Model validations' do
    it { is_expected.to validate_presence_of(:name) }
  end
end
