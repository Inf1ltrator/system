class System < ActiveRecord::Base
	has_many :lists
	has_many :users, :through => :lists
	has_many :tasks

	validates :tag, presence: true, uniqueness: { case_sensitive: false }
end
