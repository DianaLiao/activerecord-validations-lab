require 'pry'

class Post < ActiveRecord::Base

  
  validates :title, presence: true
  validate :title_must_be_clickbait
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction), message: "The category must be either 'Fiction' or 'Non-Fiction'."}


  def title_must_be_clickbait 
    if  (/Won't Believe|Secret|Top \d|Guess/).match?(title)
      errors.add(:title, "Not clickbait-y enough")
    end 
  end




end
