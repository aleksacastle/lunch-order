class Item < ApplicationRecord
  belongs_to :lunches
  belongs_to :menu

  enum category: [ :first_course, :second_course, :third_course ]

  scope :first_course, -> { where(category: first_course) }
  scope :second_course, -> { where(category: second_course) }
  scope :third_course, -> { where(category: third_course) }

end
