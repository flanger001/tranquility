namespace :events do
  desc "Deletes events without a corresponding schedule"
  task :delete_invalid => :environment do
    events = Event.where.not(:schedule_id => Schedule.select(:id))
    puts "Deleting #{events.size} events..."
    events.destroy_all
    puts "Deleted."
  end
end
