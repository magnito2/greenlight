require 'rails_helper'

RSpec.describe School, type: :model do
  before do
    @school = create(:school)
    @user = create(:user)
    @user.school = @school
  end

  context 'validations' do
    it { should validate_presence_of(:name) }
  end

  context 'associations' do
    it { should have_many(:rooms) }
    it { should have_many(:users) }
  end
end
