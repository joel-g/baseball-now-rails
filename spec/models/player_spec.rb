require 'rails_helper'

describe Player, type: :model do
  context 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:pitches_faced) }
    it { is_expected.to validate_presence_of(:hits) }
    it { is_expected.to validate_presence_of(:date) }
  end
end
