class Inquiry < ApplicationRecord
  validates :name, :email_address, :content, presence: true
  validates :phone_number, format: { with: /\d{3}-\d{3}-\d{4}/, message: "incorrectly formatted. Please type phone number in 555-555-5555 format" }, allow_blank: true
  validates :email_address, format: { with: URI::MailTo::EMAIL_REGEXP, message: "incorrectly formatted. Please check your email and try again" } 
end
