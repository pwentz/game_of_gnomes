class Category < ActiveRecord::Base
  has_many :gnomes
  validates_format_of :name, with: /^[a-zA-Z\d ]+$/, :multiline => true


  def to_param
    self.name.parameterize
  end

  def self.find_by_name(params_id)
    where('lower(name) = ?', deparameterize(params_id)).first
  end

  def self.deparameterize(params_id)
    params_id.tr("-", " ")
  end
end
