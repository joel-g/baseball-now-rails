class Player < ApplicationRecord
  validates_presence_of :name, :pitches_faced, :hits, :date
end
