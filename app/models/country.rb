class Country < ActiveRecord::Base
  has_many :states
  attr_accessible :name, :nationality
  validates :name, :nationality, :presence => true
  
  def self.search(search, page)
    paginate :per_page => 10, :page => page, :order => 'name'         
  end
  
  searchable do
    integer :id
    text :name
    text :states do
      states.map {|state| state.name}
    end
  end
  
end
