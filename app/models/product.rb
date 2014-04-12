class Product < ActiveRecord::Base
  validates :name, presence: true
  validates :price, presence: true
  has_attached_file :picture, :styles => { :thumb => "100x100>", :medium => "300x300>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/

  def self.search(*text)
    if Product.basic_search(text).length > 0
      Product.basic_search(text)
    else
      false
    end
  end
end
