require_relative '../../db/config'

class Student < ActiveRecord::Base
  # implement your Student model here
  validates :email, :format => { :with => /(.@.+\...+)/}
  validates :email, :uniqueness => true
  validates :age, :numericality => {:greater_than => 4}
  validates :phone, format: { with: /.*\d{3}.*\d{3}.*\d{4}.*/}

  has_many :subjects
  has_many :teachers, through: :subjects

  def fullname
    "#{first_name} #{last_name}"
  end

  def age
    dif = Date.today - birthday
    age = (dif / 365.25).floor
    age
  end
end
