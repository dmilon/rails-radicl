class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :follows, dependent: :destroy
  has_many :farms, through: :follows
  belongs_to :farm, optional: true
  has_many :actions, dependent: :nullify
  has_many :products, through: :farm
  has_many :zones, through: :farm
  has_many :elements, through: :zones

  mount_uploader :avatar, PhotoUploader

  validates :name, presence: true
  validates :email, presence: true

  def follow?(garden)
    !Follow.find_by(user: self, garden: garden).nil?
  end
end
