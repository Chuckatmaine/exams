class QuestionCourse < ActiveRecord::Base
 attr_accessible :course_id, :question_id
 belongs_to :question
 belongs_to :course

 attr_accessible :course
end
