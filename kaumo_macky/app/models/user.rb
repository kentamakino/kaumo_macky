class User < ActiveRecord::Base
  has_many :created_events,class_name:'Event',foreign_key: :owner_id
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable



end
