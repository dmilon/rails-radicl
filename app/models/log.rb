class Log < ApplicationRecord
  belongs_to :user
  has_many :log_scopes, dependent: :destroy
  has_many :elements, through: :log_scopes
  ACTIONS = [
    "Labourage",
    "Fertilisation",
    "Semis",
    "Repiquage",
    "Arrosage",
    "Désherbage",
    "Paillage",
    "Protection",
    "Récolte",
    "Nettoyage",
    "Distribution",
    "Autres"
    ]
  validates :category, inclusion: { in: ACTIONS }

  def done?
    log.status
  end
end
