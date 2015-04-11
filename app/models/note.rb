class Note < ActiveRecord::Base
  validates :title, presence: true
  validates :text, presence: true
  validates :published, presence: true
end
