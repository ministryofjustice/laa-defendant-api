# frozen_string_literal: true

RSpec.describe RepresentationOrder, type: :model do
  it { should belong_to(:defendant) }

  it { should validate_presence_of(:maat_reference) }
  it { should validate_presence_of(:issued_at) }
end
