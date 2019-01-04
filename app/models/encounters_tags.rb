class EncountersTags < ApplicationRecord
  belongs_to :encounter
  belongs_to :tag
end
