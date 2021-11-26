# == Schema Information
#
# Table name: courses
#
#  id            :bigint           not null, primary key
#  name          :string
#  prereq_id     :integer
#  instructor_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Course < ApplicationRecord
    has_many :enrollments,
    foreign_key: :enrollment_id,
    primary_key: :id,
    class_name: :Enrollment

    has_many :enrolled_students,
    through: :enrollments,
    source: :user

    belongs_to :prerequisite,
    class_name: :Course,
    primary_key: :d,
    foreign_key: :prereq_id

    belongs_to :instructor,
    class_name: :User,
    foreign_key: :instructor_id,
    primary_key: :id

end
