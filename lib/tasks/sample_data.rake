namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    Project.create!(:title => "Example Project",
                 :status => "live",
                 :outcome => "Example outcome")
    99.times do |n|
      title  = "example-#{n+1}"
      status = "live"
      outcome  = "test outcome"
      Project.create!(:title => title,
                   :status => status,
                   :outcome => outcome)
    end
  end
end

