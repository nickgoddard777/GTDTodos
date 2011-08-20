

Factory.sequence :title do |n|
  "project-#{n}"
end

Factory.sequence :email do |n|
  "person-#{n}@example.com"
end

Factory.define :user do |user|
  user.sequence(:email) { |n| "person-#{n}@example.com"}
  user.password "test1234"
end

Factory.define :admin_role, :class => Role do |admin_role|
  admin_role.name "admin"
end

Factory.define :paid_role, :class => Role do |paid_role|
  paid_role.name "paid_user"
end

Factory.define :admin, :parent => :user do |admin|
end

Factory.define :paid_user, :parent => :user do |paid_user|

end

Factory.define :paid_user_with_role do |puwr|
  puwr.association :paid_user
  puwr.association :paid_role
end

Factory.define :admin_with_role do |awr|
  awr.association :admin
  awr.association :admin_role
end

Factory.define :project do |project|
  project.title "MOT car"
  project.status "live"
  project.outcome "Get MOT certificate"
end

Factory.define :todo do |todo|
  todo.title "ring garage"
  todo.description "ring the garage on 01709887766"
  todo.status "live"
  todo.next_action true
  todo.association :project
  todo.association :paid_user
end

