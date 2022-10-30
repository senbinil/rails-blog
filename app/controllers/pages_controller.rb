# frozen_string_literal: true

class PagesController < ApplicationController
  def index
    render json: { message: 'Connected!', version: 'v0.1' }
  end
end
