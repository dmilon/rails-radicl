class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :garden, optional: true
  has_many :logs, dependent: :destroy
  has_many :follows, dependent: :destroy
  mount_uploader :avatar, PhotoUploader
  validates :name, presence: true
  validates :email, presence: true
  validates :admin, presence: true

  def follow?(garden)
    !Follow.find_by(user: self, garden: garden).nil?
  end
end
