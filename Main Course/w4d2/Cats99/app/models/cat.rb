# == Schema Information
#
# Table name: cats
#
#  id          :integer          not null, primary key
#  name        :string           not null
#  birth_date  :date             not null
#  color       :string           not null
#  sex         :string(1)        not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'action_view'
require 'action_view/helpers'
include ActionView::Helpers::DateHelper

class Cat < ApplicationRecord

  COLORS = %w(black white gray orange brown)

  validates :birth_date, :name, :color, :sex, :description, presence: true
  validates :color, inclusion: COLORS
  validates :sex, inclusion: ['M', 'F']



  def age
    time_ago_in_words(self.birth_date)
  end

  def all_colors
    COLORS
  end


  has_many :cat_rental_requests, dependent: :destroy


end
