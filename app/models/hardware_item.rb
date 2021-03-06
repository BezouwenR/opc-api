# == Schema Information
#
# Table name: hardware_items
#
#  id                           :bigint(8)        not null, primary key
#  name                         :string
#  alternate_name               :string
#  description                  :text
#  hardware_type_id             :bigint(8)
#  compatible_with_all_vehicles :boolean
#  available_for_purchase       :boolean
#  purchase_url                 :string
#  requires_assembly            :boolean
#  can_be_built                 :boolean
#  build_plans_url              :string
#  notes                        :text
#  image_url                    :string
#  install_guide_url            :string
#  created_at                   :datetime         not null
#  updated_at                   :datetime         not null
#

class HardwareItem < ApplicationRecord
  extend FriendlyId
  has_one_attached :image
  friendly_id :name, use: :slugged
  belongs_to :hardware_type, optional: true
  after_save :set_image_scraper
  has_many :guide_hardware_items
  has_many :guides, :through => :guide_hardware_items
  has_many :video_hardware_items
  has_many :videos, :through => :video_hardware_items

  before_save :set_markup
  
  def set_image_scraper
    if saved_change_to_source_image_url?
      DownloadImageFromSourceWorker.perform_async(id,HardwareItem)
    end
  end

  def set_markup
    if self.description.present?
      self.description_markup = Octokit.markdown(self.description, :mode => "gfm", :context => "commaai/openpilot")
    end
  end
  
  # has_many :vehicle_config_hardware_items
  # has_many :video_hardware_items
  # has_many :videos, :through => :video_hardware
  # has_many :vehicle_configs, :through => :vehicle_config_hardware_items
end 
