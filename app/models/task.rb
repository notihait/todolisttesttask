class Task < ApplicationRecord
  validates :title, presence: true, length: { maximum: 200 }

  scope :ordered, -> { order(:completed, created_at: :desc) }
end