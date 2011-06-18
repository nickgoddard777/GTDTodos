Factory.define :project do |project|
  project.title "MOT car"
  project.status "live"
  project.outcome "Get MOT certificate"
end

Factory.sequence :title do |n|
  "project-#{n}"
end

Factory.define :user do |user|
  user.email "test@test.com"
  user.password "test1234"
end

Factory.define :todo do |todo|
  todo.title "ring garage"
  todo.description "ring the garage on 01709887766"
  todo.status "live"
  todo.next_action true
  todo.association :project
end

