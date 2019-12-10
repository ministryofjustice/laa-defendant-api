# frozen_string_literal: true

class Defendant < ApplicationRecord
  has_many :representation_orders

  validates_presence_of :last_name, :first_name, :date_of_birth
end
