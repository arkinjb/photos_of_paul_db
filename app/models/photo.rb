class Photo < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy

  def self.search(query)
    where("title ILIKE ?", "%#{query}%")
  end

end
