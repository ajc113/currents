# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "https://www.currentsfishing.com"

SitemapGenerator::Sitemap.create do
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  add '/about'
  add '/maps'
  add '/reports'
  add '/spotter'
  add '/vhf'

  #
  #   add articles_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add all articles:
  #
    Spot.find_each do |spot|
      add spot_path(spot), :lastmod => spot.updated_at
    end
    Intel.find_each do |intel|
      add intel_path(intel), :lastmod => intel.updated_at
    end
    Post.find_each do |post|
      add post_path(post), :lastmod => post.updated_at
    end
end
