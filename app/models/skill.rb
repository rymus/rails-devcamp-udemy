class Skill < ApplicationRecord
  include Placeholder
  
  validates_presence_of :title, :percent_utilized
  
  after_initialize :set_defaults
  #after_initialize runs after the .new action is called
  #after_create runs after the .create action is called
  def set_defaults
    # Calling the placeholder image generator in concerns/placeholder.rb
    self.badge ||= Placeholder.image_generator(height: '250', width: '250')
    
  end
end
