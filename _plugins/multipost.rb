module Jekyll
  class MultiPost < Post

    # Initialize this MultiPost instance.
    #
    # site       - The Site.
    # base       - The String path to the dir containing the post file.
    # name       - The String filename of the post file.
    # layout     - The layout to use for the post.
    #
    # Returns the new Post.
    def initialize(site, source, dir, name, layout)
      @site = site
      @dir = dir
      @base = self.containing_dir(source, dir)
      @name = name

      self.categories = dir.downcase.split('/').reject { |x| x.empty? }
      self.process(name)
      self.read_yaml(@base, name)

      # Declare the layout for this instance
      self.data["layout"] = layout

      # Declare the unique permalink for this instance
      title = CGI.escape(slug)
      self.data["permalink"] = "/#{title}/#{layout}"

      if self.data.has_key?('date')
        self.date = Time.parse(self.data["date"].to_s)
      end

      self.published = self.published?

      self.populate_categories
      self.populate_tags
    end
  end

  class MultiPostGenerator < Generator
    safe true

    def generate(site)
      site.posts.each do |post|
        if post.data["layout"].is_a? Array
          post.data["layout"].each do |layout|
            site.posts << MultiPost.new(site, site.source, "", post.name, layout)
          end
        end
      end

      site.posts.delete_if { |post| post.data["layout"].is_a? Array }
    end
  end
end
