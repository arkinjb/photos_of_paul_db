class Photo < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorite_photos, dependent: :destroy

  def self.search(query)
    where("title ILIKE ?", "%#{query}%")
  end

  mount_uploader :file, FileUploader

end
