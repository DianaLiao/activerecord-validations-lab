class Author < ActiveRecord::Base
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validate :phone_number_must_be_ten_digits

  # attempt at being more more flexible?
  #  def phone_number_must_be_ten_digits
  #   if phone_number.present? && phone_number.chars.select{|char| /\w/.match(char)}.count == 10
  #     errors.add(:phone_number, "is not a ten digit phone number")
  #   end  

  # end

  def phone_number_must_be_ten_digits
    if phone_number.chars.count != 10
      errors.add(:phone_number, "is not a ten digit phone number")
    end
  end
  
  
end
