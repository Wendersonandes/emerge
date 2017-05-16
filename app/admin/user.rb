ActiveAdmin.register User do

	filter :first_name
	filter :email

	index do
		column :first_name do |user|
			link_to user.first_name, admin_user_path(user)
		end
		column :email                  
		column :sign_in_count                            
		actions
	end

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

end
