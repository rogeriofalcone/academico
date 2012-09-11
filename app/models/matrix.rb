class Matrix < ActiveRecord::Base
  belongs_to :course
  belongs_to :matrix_evaluation_type
  belongs_to :matrix_status
  belongs_to :class_season_type
  has_many :matrix_disciplines
  has_many :timetables
  attr_accessible :ended_at, :maxdisciplines, :maxseasons, :started_at, :class_season_type_id, :matrix_status_id, :matrix_evaluation_type_id, :course_id

  def model_custom_name
       self.id.to_s+ ' - ' + self.course.name + ' - '  + self.course.dept.acronym
  end  
  
  def matrix_status_desc
    self.matrix_status.description
  end
  
  def course_name
    self.course.name
  end
  
  searchable do
    text :matrix_status_desc, :course_name, :model_custom_name
    
  end
  
end
