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

require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
