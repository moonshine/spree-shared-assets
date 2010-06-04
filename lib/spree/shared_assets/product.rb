module Spree::SharedAssets::Product

  def self.included(target)
    target.class_eval do
      has_many :assets_shares, :dependent => :destroy, :as => :shareable
      has_many :images, :source => :asset, :foreign_key => "asset_id", :through => :assets_shares, :class_name => "Image"
    end
  end
  
end
