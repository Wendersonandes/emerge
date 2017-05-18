ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do

		columns do
			column do
       panel "Oportunidades mais visualizadas" do
          table_for Opportunity.most_viewed.limit(5) do
            column("Título") {|opportunity| link_to(opportunity.title, admin_opportunity_path(opportunity)) }
						column("Visualizações")   {|opportunity| opportunity.impressionist_count(:filter=>:ip_address) }
          end
        end
			end
			column span: 2 do
				panel "Adicionar uma nova oportunidade" do
					render :partial => "opportunity_form"
				end
			end
		end

    columns do

      column do
        panel "Oportunidades mais visualizadas" do
          table_for Opportunity.most_viewed.limit(5) do
            column("Título"){|opportunity| link_to(opportunity.title, admin_opportunity_path(opportunity)) }
						column("Visualizações")   {|opportunity| opportunity.impressionist_count(:filter=>:ip_address) }
          end
        end
      end

      column do
        panel "Usuário novos" do
          table_for User.order('id desc').limit(10).each do |user|
            column(:email)    {|user| link_to(user.email, admin_user_path(user)) }
          end
        end
      end

      column do
        panel "Usuários que mais acessam" do
          table_for User.order('sign_in_count desc').limit(5).each do |user|
            column(:email)    {|user| link_to(user.email, admin_user_path(user)) }
						column("Número de acessos") {|user| user.sign_in_count}
          end
        end
      end
		end

    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  end # content
end
