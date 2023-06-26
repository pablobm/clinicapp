class Doctor < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :full_name, presence: true
  validates :phone, presence: true
  validates :phone, numericality: {only_integer: true}
  validates :phone, length: {is: 10}
  
  belongs_to :category
  has_many :appointments, dependent: :destroy
  has_many :users, through: :appointments
  has_one_attached :attachment
  
  def email_required?
    false
  end

  def email_changed?
    false
  end
end
