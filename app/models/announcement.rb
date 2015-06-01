class Announcement < ActiveRecord::Base
  attr_accessible :description, :title
  # attr_accessible :image

  # has_attached_file :image,
  #   styles: {
  #     hdr_list: "395>",
  #     normal:   "245",
  #     thumb:    "114x79#"
  #   },
  #   default_url: "/images/:style/missing.png"

  # validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
