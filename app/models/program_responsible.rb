# == Schema Information
#
# Table name: program_responsibles
#
#  id         :integer          not null, primary key
#  program_id :integer
#  profile_id :integer
#

class ProgramResponsible < ActiveRecord::Base
	belongs_to :responsible, :class_name => "Profile", :foreign_key => "profile_id"
	belongs_to :program
end
