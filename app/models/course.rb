class Course < ActiveRecord::Base
  belongs_to :dept
  belongs_to :registration_scheme
  belongs_to :class_season_type
  belongs_to :learning_modality
  belongs_to :knowledge_area
  belongs_to :techaxes
  belongs_to :education_modality
  has_many :disciplines
  has_many :matrices
  attr_accessible :code, :ended_at, :goal, :maxtime, :mintime, :name, :nickname, :started_at, :dept, :techaxes_id, :learning_modality_id, :education_modality_id, :class_season_type_id, :knowledge_area_id, :dept_id, :registration_scheme_id
  
  
  def dept_acronym
    self.dept.dept.try(:acronym)+"-"+self.dept.try(:acronym)
  end

  def dept_name
    self.dept.try(:name)
  end  
  
  searchable do
    text :code, :name, :nickname, :dept_acronym, :dept_name
    
  end
  
end
