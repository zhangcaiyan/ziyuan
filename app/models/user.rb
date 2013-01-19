#coding: utf-8


class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable, :confirmable, :async, :authentication_keys => [:login]

  attr_accessible :email, :username, :login, :password, :password_confirmation, :remember_me

  attr_accessor :login

  validates_presence_of :email, :username, :password, :password_confirmation
  validates :email, format: {with: RubyRegex::Email}, uniqueness: true
  validates :username, uniqueness: true
  validates :password, confirmation: true, length: {minimum: 6}



  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    login = conditions.delete(:login)
    where(conditions).where(["lower(username) = :value OR lower(email) = :value", { value: login.strip.downcase }]).first
  end 
end
