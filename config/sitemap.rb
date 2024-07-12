# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "https://test-autism.com"
SitemapGenerator::Sitemap.compress = false

SitemapGenerator::Sitemap.create do
  paths = [
    { path: '', priority: 0.5 },
    { path: '/test', priority: 0.8 },
    { path: '/pages/about', priority: 0.4 },
    { path: '/pages/faq', priority: 0.4 },
    { path: '/pages/privacy_policy', priority: 0.2 },
    { path: '/pages/translations', priority: 0.2 },
    { path: '/blogs', priority: 0.4 }
  ]

  I18n.available_locales.each do |lang|
    paths.each do |path_info|
      add "/#{lang}#{path_info[:path]}", priority: path_info[:priority], changefreq: 'weekly'
    end
  end

  # Blogs posts
  Blog.find_each do |blog|
    add blog_url(blog, locale: :en, only_path: true), lastmod: blog.updated_at, changefreq: 'daily', priority: 0.5
  end

end
