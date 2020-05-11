# frozen_string_literal: true

# Role.create_default_roles("greenlight")
# Rake::Task['admin:create'].invoke

school_list = [
  "Othaya Girls",
  "Default"
]

school_list.each do |school|
  School.create(name: school) if School.find_by_name(school).blank?
end
