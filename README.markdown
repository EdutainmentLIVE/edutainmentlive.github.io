# ITProTV developer blog

This is the repository for the ITProTV developer blog.

## For readers

The blog is available at <https://engineering.itpro.tv>.

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
locally run

```sh
docker build --tag blag . && docker run --rm --tty --interactive --publish 4000:4000 blag
```

Then go to <http://localhost:4000>. Note that it will not rebuild on change so you have
to restart the container to see any changes.
