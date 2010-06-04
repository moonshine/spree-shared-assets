# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class SharedAssetsExtension < Spree::Extension
  version "1.0"
  description "Allows assets to be shared between products and variants"
  url "http://yourwebsite.com/shared_assets"

  # Please use shared_assets/config/routes.rb instead for extension routes.

  # def self.require_gems(config)
  #   config.gem "gemname-goes-here", :version => '1.2.3'
  # end
  
  def activate

    # Add additional associations to allow m:m relationship
    # between asset<->products/variants
    Asset.send(:include, Spree::SharedAssets::Asset)
    Product.send(:include, Spree::SharedAssets::Product)
    Variant.send(:include, Spree::SharedAssets::Variant)

    Admin::ImagesController.send(:include, Spree::SharedAssets::Admin::ImagesController)
  end
end
