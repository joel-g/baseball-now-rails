class Player < ApplicationRecord
  validates_presence_of :name, :pitches_faced, :hits, :date
  validates :pitches_faced, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 50 }
  validates :hits, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 10 }
  validates :innings, numericality: { greater_than_or_equal_to: 1 }
end
