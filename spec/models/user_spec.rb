require 'rails_helper'

describe User, type: :model do

  context 'associations' do
    it 'should have one to many association with restaurants' do
      should have_many(:restaurants)
    end
  end


end