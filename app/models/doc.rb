# == Schema Information
#
# Table name: docs
#
#  id             :integer          not null, primary key
#  opportunity_id :integer
#  description    :string
#  language       :string
#  doc_type       :string
#  doc            :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  doc_data       :text
#

class Doc < ActiveRecord::Base
  belongs_to :opportunity
  include DocUploader[:doc]
end
