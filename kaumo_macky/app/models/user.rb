class User < ActiveRecord::Base

  before_destroy :check_all_events_finished

  has_many :created_events,class_name:'Event',foreign_key: :owner_id ,dependent: :nullify
  has_many :tickets,dependent: :nullify
  has_many :participating_events,through: :tickets,source: :event
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  private

  def check_all_events_finished
  	now = Time.zone.now
  	if created_events.where(':now < end_time',now: now).exists?
  		errors[:base] << '公開中の未終了イベントが存在します。'
  	end

  	if participating_events.where(':now < end_time',now: now).exists?
  		errors[:base] <<'未終了の参加イベントが存在します。'
  	end
  	erros.blank?
  end


end
