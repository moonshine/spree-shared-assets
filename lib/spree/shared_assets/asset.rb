module Spree::SharedAssets::Asset  

  def self.included(target)
    target.class_eval do
      has_many :assets_shares, :dependent => :destroy
      has_many :variants, :source => :shareable, :through => :assets_shares, :source_type => "Variant", :class_name => "Variant"
      has_many :products, :source => :shareable, :through => :assets_shares, :source_type => "Product", :class_name => "Product"
    end
  end
  
end
