# frozen_string_literal: true

class DefendantsController < ApplicationController
  before_action :set_defendant, only: %i[show update destroy]

  # GET /defendants
  def index
    @defendants = Defendant.all
    json_response(@defendants)
  end

  # GET /defendants/:id
  def show
    json_response(@defendant)
  end

  private

  def set_defendant
    @defendant = Defendant.find(params[:id])
  end
end
