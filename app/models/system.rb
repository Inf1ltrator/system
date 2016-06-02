class System < ActiveRecord::Base
	has_many :lists
	has_many :users, :through => :lists
	has_many :tasks
end
