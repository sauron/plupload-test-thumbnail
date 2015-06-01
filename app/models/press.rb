class Press < ActiveRecord::Base
  attr_accessible :description, :title
  attr_accessible :image

  has_attached_file :image,
    :styles => { :medium => "300x300>", :thumb => "100x100>" },
    :default_url => "/images/:style/missing.png"

  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates_attachment_presence :image

  validates :description, :title, presence: true
end
