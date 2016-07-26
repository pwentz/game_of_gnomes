class Category < ActiveRecord::Base
  has_many :gnomes

  def to_param
    self.name.parameterize
  end

  def self.find_by_name(params_id)
    find_by(name: deparameterize(params_id))
  end

  def self.deparameterize(params_string)
    params_string.split("-").join(" ").humanize
  end
end
