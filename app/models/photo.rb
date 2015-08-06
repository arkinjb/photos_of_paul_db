class Photo < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorite_photos, dependent: :destroy

  has_attached_file :image {
    :url => "photos/images/000/000/016/original/:image_file_name"
  }
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  def self.search(query)
    where("title ILIKE ?", "%#{query}%")
  end

  # mount_uploader :file, FileUploader

end
