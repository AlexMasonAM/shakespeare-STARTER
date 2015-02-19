class Book < ActiveRecord::Base
  
  has_many :reviews
  has_many :favorites
  has_many :favorited_users, through: :favorites, source: :user

  validates :title, :author, :one_liner, :cover_url, :summary, 
    presence: true, 
    allow_blank: false,
    allow_nil: false

end
