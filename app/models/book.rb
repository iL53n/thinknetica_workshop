class Book < ApplicationRecord
  DAY = 86_400

  validates :title, :body, :author, presence: true
  validates :title, uniqueness: true

  scope :week, -> { where('created_at > ?', Time.now - (7 * DAY)) }

  before_validation :set_empty_body

  private

  def set_empty_body
    self.body ||= 'No description'
  end
end
