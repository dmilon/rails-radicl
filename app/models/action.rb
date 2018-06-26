class Action < ApplicationRecord
  belongs_to :user
  belongs_to :element

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
