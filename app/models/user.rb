class User < ApplicationRecord
  has_many :lunches

  enum role: [ :user, :admin ]

  serialize :auth_meta_data
end
