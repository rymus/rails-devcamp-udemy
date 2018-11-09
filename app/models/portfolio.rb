class Portfolio < ApplicationRecord
  has_many :technologies
  
  include Placeholder
  
  validates_presence_of :title, :body, :main_image, :thumb_image
  
  # Custom scope example 1
  def self.angular
    where(subtitle: 'Angular')
  end
  
  # Custom scope example 2
  scope :ruby_on_rails_portfolio_items, -> {where(subtitle: 'Ruby on Rails')}
  
  after_initialize :set_defaults
  #after_initialize runs after the .new action is called
  #after_create runs after the .create action is called
  def set_defaults
    self.main_image ||= Placeholder.image_generator(height: '600', width: '400')
    self.thumb_image ||= Placeholder.image_generator(height: '350', width: '200')
  end
  
end