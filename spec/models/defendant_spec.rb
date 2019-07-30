require 'rails_helper'

RSpec.describe Defendant, type: :model do
  it { should have_many(:representation_orders) }
  # Validation tests
  # ensure columns title and created_by are present before saving
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:date_of_birth) }
end
