module Users
	class ProvidersCell < Cell::ViewModel

		def show
			render
		end

		def flow
			options[:flow] ||= 'login'
		end

		def css_class
			'btn btn-primary'
		end

		def providers
			Authentication.providers
		end

	end
end
