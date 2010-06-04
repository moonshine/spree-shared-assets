namespace :spree do
  namespace :extensions do
    namespace :shared_assets do
      desc "Copies public assets of the Shared Assets to the instance public/ directory."
      task :update => :environment do
        is_svn_git_or_dir = proc {|path| path =~ /\.svn/ || path =~ /\.git/ || File.directory?(path) }
        Dir[SharedAssetsExtension.root + "/public/**/*"].reject(&is_svn_git_or_dir).each do |file|
          path = file.sub(SharedAssetsExtension.root, '')
          directory = File.dirname(path)
          puts "Copying #{path}..."
          mkdir_p RAILS_ROOT + directory
          cp file, RAILS_ROOT + path
        end
      end  
    end
  end
end


namespace :spree do
  namespace :extensions do
    namespace :shared_assets do
      desc "Copy existing assets into the shared assets model"
      task :copy_shared_assets => :environment do
        Asset.all.each do |asset|
          AssetsShare.create(:asset => asset, :shareable => asset.viewable)
        end
      end
    end
  end
end