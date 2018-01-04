# == Schema Information
#
# Table name: cat_rental_requests
#
#  id         :integer          not null, primary key
#  cat_id     :integer          not null
#  start_date :date             not null
#  end_date   :date             not null
#  status     :string           default("PENDING"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CatRentalRequest < ApplicationRecord
  validates :cat_id, :start_date, :end_date, :status, presence: true
  validates :status, inclusion: ["PENDING", "APPROVED", "DENIED"]
  validate :cannot_overlap_with_approved_requests

  belongs_to :cat



  # private

  def cannot_overlap_with_approved_requests
    rentals = CatRentalRequest.where(cat_id: self.cat_id)

    unless rentals.empty?
      rentals.each do |rental|
        @rental = rental
        if rental.status == 'APPROVED'
          errors[:overlap] << 'Cat is busy!' if overlap?
        end
      end
    end
  end

  def overlap?
    @rental.start_date >= self.start_date && @rental.start_date <= self.end_date ||
    @rental.end_date >= self.start_date && @rental.start_date <= self.end_date
  end
end
