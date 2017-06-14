require_relative '../config'

class CreateTeachersStudents < ActiveRecord::Migration
	
	def change
		create_table :subjects do |t|
			t.integer :student_id
			t.integer :teacher_id
			t.timestamps
		end
	end
end