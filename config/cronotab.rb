# cronotab.rb — Crono configuration file
#
# Here you can specify periodic jobs and schedule.
# You can use ActiveJob's jobs from `app/jobs/`
# You can use any class. The only requirement is that
# class should have a method `perform` without arguments.
#
require 'rake'
Rails.app_class.load_tasks
class TestJob
	def perform
		Rake::Task['crono:hello'].invoke
	end
end
class OpportunityNotification
	def perform
		Rake::Task['notifications:closing_in_seven_days'].invoke
		Rake::Task['notifications:closing_in_seven_days'].reenable
	end
end
#
Crono.perform(OpportunityNotification).every 1.minute
#
