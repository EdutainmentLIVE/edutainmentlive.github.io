# ITProTV developer blog

This is the repository for the ITProTV developer blog.

## For readers

The blog is available at <http://engineering.itpro.tv>.

## For writers

The blog posts are stored in the `_posts` folder. Their names should look like
`YYYY-MM-DD-the-title.markdown`. So you could make a new post at
`_posts/2018-03-29-hello-world.markdown.`

The content of the post should be Markdown. Pretty much anything that works in
a GitHub comment box should work in a post. Be sure to start your post with a
title.

``` markdown
# Hello, world!

@EdutainmentLIVE :heart: Haskell!
```

You should work on posts in branches and open pull requests to discuss them.
**Anything on the `master` branch goes to production!**

## For developers

The blog is powered by [GitHub Pages](https://pages.github.com). To preview it
locally you'll need Ruby, which ships with macOS. You can generate the site
with these commands:

``` sh
# Install dependencies.
$ gem install --file gems.rb --no-document --user-install

# Build site.
$ ~/.gem/ruby/*/bin/jekyll serve

# Go to <http://localhost:4000>.
```
