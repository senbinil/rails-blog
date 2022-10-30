# frozen_string_literal: true

class Task < ApplicationRecord
  enum :status, %i[done pending]
  # validation
  validates :title, presence: true
end
