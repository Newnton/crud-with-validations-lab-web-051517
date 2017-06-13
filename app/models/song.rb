class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :artist_name, presence: true
  validates :released, inclusion: {in: [true, false]}
  validate :date_released
  validate :is_repeat


    def is_repeat
      compare_song = Song.find_by(release_year: release_year, title: title)
      if !compare_song.nil?
        errors.add(:is_repeat, "needs a title containing Won't Believe, Secret, Top [number], or Guess")
        return false
      end
    end

    def date_released
      if released != false
        if release_year == nil || release_year >= 2017
          errors.add(:date_released, "needs a title containing Won't Believe, Secret, Top [number], or Guess")
          return false
        end
      end
    end
end
