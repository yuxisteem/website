# frozen_string_literal: true
class User < ApplicationRecord
  has_one :account

  after_create :create_account

  validates_presence_of :email, :password

  delegate :admin?, to: :account

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
