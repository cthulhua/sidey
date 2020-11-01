require 'fileutils'

# Remove all .html ext of pages and posts, for pretty url and S3 restriction
# Production only

Jekyll::Hooks.register :pages, :post_write do |page|
  if Jekyll.env == 'production'
    path = page.destination('/')
    if path.end_with?('.html')
      FileUtils.mv(path, path.sub(/\.html$/, ''))
    end
  end
end

Jekyll::Hooks.register :posts, :post_write do |post|
  if Jekyll.env == 'production'
    path = post.destination('/')
    if path.end_with?('.html')
      FileUtils.mv(path, path.sub(/\.html$/, ''))
    end
  end
end
