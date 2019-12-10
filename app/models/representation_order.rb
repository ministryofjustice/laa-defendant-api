# frozen_string_literal: true

class RepresentationOrder < ApplicationRecord
  belongs_to :defendant

  # validation
  validates_presence_of :issued_at, :maat_reference
end
