class Profile < ApplicationRecord
  belongs_to :user
  validates :content, presence: true, length: { maximum: 255 }
  validates :language, presence: true
  validates :github, presence: true
end
