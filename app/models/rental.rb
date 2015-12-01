class Rental < ActiveRecord::Base
  belongs_to :rental_type
  has_many :ordered_trips
  has_many :orders, through: :ordered_trips
  has_attached_file :image, default_url: "http://robbielane.net/works/haines/photos/HainesLutakRoad.jpg"

  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]
  validates :name, :description, :price, :rental_type_id, presence: true
  validates_numericality_of :price, greater_than: 0

  def retire
    self.update(status: "retired")
  end

  def retired?
    status == "retired"
  end
end