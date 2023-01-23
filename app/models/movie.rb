class Movie < ApplicationRecord
  belongs_to :production_company
  has_many :movie_genres
  has_many :genres, through: :movie_genres

  validates :title, :year, :duration, :description, :average_vote, presence: true
  # arguent after
end
