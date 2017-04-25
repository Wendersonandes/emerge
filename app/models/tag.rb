# == Schema Information
#
# Table name: tags
#
#  id             :integer          not null, primary key
#  taggings_count :integer          default(0)
#  parent_id      :integer
#  lft            :integer
#  rgt            :integer
#  depth          :integer          default(0), not null
#  children_count :integer          default(0), not null
#  content        :text
#  name           :string
#

class Tag < ActsAsTaggableOn::Tag
end
