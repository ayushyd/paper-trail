namespace :countries_task do
  desc "Country list"
  task countries_list: :environment do
     Country.all.each do |country|
        puts "All countries list successfully! Total: #{country&.safe_name}"
    end
  end
end
