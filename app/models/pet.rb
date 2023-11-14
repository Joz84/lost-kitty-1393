class Pet < ApplicationRecord
    validates :address, presence: true
    validates :specie, inclusion: { in: %w(cat dog rabbit panda aligator)}
end
