class Book < ActiveRecord::Base
  
  has_many :reviews

  validates :title, :author, :one_liner, :cover_url, :summary, 
    presence: true, 
    allow_blank: false,
    allow_nil: false

end
