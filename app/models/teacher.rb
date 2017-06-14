require_relative '../../db/config'
require "sqlite3"

class Teacher < ActiveRecord::Base
  # has_many :students
  has_many :subjects
  has_many :students, through: :subjects
  validates :email, :uniqueness => true
end
