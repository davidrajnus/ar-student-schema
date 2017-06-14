require 'rake'
require 'rspec/core/rake_task'
require_relative 'db/config'
require_relative 'lib/students_importer'
require_relative 'app/models/teacher'
require_relative 'app/models/student'
require_relative 'app/models/subject'

desc "create the database"
task "db:create" do
  touch 'db/ar-students.sqlite3'
end

desc "drop the database"
task "db:drop" do
  rm_f 'db/ar-students.sqlite3'
end

desc "migrate the database (options: VERSION=x, VERBOSE=false, SCOPE=blog)."
task "db:migrate" do
  ActiveRecord::Migrator.migrations_paths << File.dirname(__FILE__) + 'db/migrate'
  ActiveRecord::Migration.verbose = ENV["VERBOSE"] ? ENV["VERBOSE"] == "true" : true
  ActiveRecord::Migrator.migrate(ActiveRecord::Migrator.migrations_paths, ENV["VERSION"] ? ENV["VERSION"].to_i : nil) do |migration|
    ENV["SCOPE"].blank? || (ENV["SCOPE"] == migration.scope)
  end
end

desc "populate the students database with sample data"
task "db:populate" do
  StudentsImporter.import
end

desc "populate the teachers database with sample data"
task "db:populate_teacher" do
  # Create some teachers for your teachers table in database
  teacher1 = Teacher.create(first_name: "Gary1", last_name: "Balls1", email: "gary@example.com", phone:12346781)
  teacher2 = Teacher.create(first_name: "Gary2", last_name: "Balls2", email: "sally@example.com", phone:12346782)
  teacher3 = Teacher.create(first_name: "Gary3", last_name: "Balls3", email: "barry@example.com", phone:12346783)
  teacher4 = Teacher.create(first_name: "Gary4", last_name: "Balls4", email: "david@example.com", phone:12346784)
  teacher5 = Teacher.create(first_name: "Gary5", last_name: "Balls5", email: "booba@example.com", phone:12346785)
  teacher6 = Teacher.create(first_name: "Gary6", last_name: "Balls6", email: "gets@example.com", phone:12346786)
  teacher7 = Teacher.create(first_name: "Gary7", last_name: "Balls7", email: "asfhaf@example.com", phone:12346787)
  teacher8 = Teacher.create(first_name: "Gary8", last_name: "Balls8", email: "sdggfs@example.com", phone:12346788)
  teacher9 = Teacher.create(first_name: "Gary9", last_name: "Balls9", email: "jnvsjvb@example.com", phone:12346789)
end

desc "populate the teachers with students"
task "db:populate_teacher_with_student" do
  Student.all.each do |student|
    student.teachers = Teacher.all.sample(4)
  end
end

desc 'Retrieves the current schema version number'
task "db:version" do
  puts "Current version: #{ActiveRecord::Migrator.current_version}"
end

desc "Run the specs"
RSpec::Core::RakeTask.new(:specs)

task :default  => :specs
