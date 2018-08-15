# == Schema Information
#
# Table name: users
#
#  id              :bigint(8)        not null, primary key
#  username        :string
#  email           :string
#  slack_username  :string
#  github_username :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  avatar_url      :string
#

FactoryBot.define do
  factory :user do
    username "MyString"
    email "MyString"
    slack_username "MyString"
    github_username "MyString"
  end
end
