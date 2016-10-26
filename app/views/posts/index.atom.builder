atom_feed do |feed|
  feed.title "CSCE 813 Security Blog"
  feed.updated @posts.first.updated_at

  @posts.each do |post|
    feed.entry(post) do |entry|
      entry.title post.title
      entry.content post.body, :type => 'html'

      entry.author do |author|
        author.name 'Installfest Attendee'
      end
    end
  end
end
