ActiveAdmin.register Tag do
	filter :name
	index do
		column :name do |tag|
			link_to tag.name, admin_tag_path(tag)
		end
		actions
	end
end
