class City < ActiveRecord::Base
  has_many :tourist_attractions, dependent: :destroy
end
