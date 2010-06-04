class AssetsShare < ActiveRecord::Base
  belongs_to :asset
  belongs_to :shareable, :polymorphic => true
end
