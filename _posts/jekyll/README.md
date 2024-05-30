# Start new Jekyll Project -- clean By Veroxy

## QUICKSTART -- Installation, launch server with default setup
````shell
echo "gem 'my-them-name'" >> Gemfile
echo "theme: my-them-name" >> _config.yml
mkdir _posts _pages _assets _layouts
touch index.html
bundle install
bundle exec jekyll serve
````

### Using RubyGems:

When installing the theme using RubyGems, demo images, posts, and pages are not included. Follow the instructions below for complete setup.

1. (Optional) Create a new Jekyll site: `jekyll new my-site`
2. Replace the current theme in your `Gemfile` with `gem "choosing-theme"` from [jekyll theme ORG](http://jekyllthemes.org/) or [jekyll them IO](https://jekyllthemes.io/free) or your own theme
3. Install the theme: `bundle install`
4. Replace the current theme in your `_config.yml` file with `theme: choosing-theme`.
5. Build your site: `bundle exec jekyll serve`

Assuming there are no errors and the site is building properly, follow these steps next:

1. Create the following pages if they do not exist already (or change the extension of exisitig markdown files from `.md` to `.html`):
   - `index.html` - set to `layout: home`
   - `about.html` - set to `layout: page`
   - `contact.html` - set to `layout: page`
   - `posts/index.html` - set to `layout: page` (you will also need to create a `posts` directory)
2. Configure the `index.html` front matter. Example:
```
---
layout: home
background: '/PATH_TO_IMAGE'
---
```
3. Configure the `about.html`, `contact.html`, and `posts/index.html` front matter. Example:
```
---
layout: page
title: Page Title
description: This is the page description.
background: '/PATH_TO_IMAGE'
---
```
4. For each post in the `_posts` directory, update the front matter. Example:
```
---
layout: post
title: "Post Title"
subtitle: "This is the post subtitle."
date: YYYY-MM-DD HH:MM:SS
background: '/PATH_TO_IMAGE'
---
```

5. Add the form to the `contact.html` page. Add the following code to your `contact.html` page:
```
<form name="sentMessage" id="contactForm" novalidate>
  <div class="control-group">
    <div class="form-group floating-label-form-group controls">
      <label>Name</label>
      <input type="text" class="form-control" placeholder="Name" id="name" required data-validation-required-message="Please enter your name.">
      <p class="help-block text-danger"></p>
    </div>
  </div>
  <div class="control-group">
    <div class="form-group floating-label-form-group controls">
      <label>Email Address</label>
      <input type="email" class="form-control" placeholder="Email Address" id="email" required data-validation-required-message="Please enter your email address.">
      <p class="help-block text-danger"></p>
    </div>
  </div>
  <div class="control-group">
    <div class="form-group col-xs-12 floating-label-form-group controls">
      <label>Phone Number</label>
      <input type="tel" class="form-control" placeholder="Phone Number" id="phone" required data-validation-required-message="Please enter your phone number.">
      <p class="help-block text-danger"></p>
    </div>
  </div>
  <div class="control-group">
    <div class="form-group floating-label-form-group controls">
      <label>Message</label>
      <textarea rows="5" class="form-control" placeholder="Message" id="message" required data-validation-required-message="Please enter a message."></textarea>
      <p class="help-block text-danger"></p>
    </div>
  </div>
  <br>
  <div id="success"></div>
  <div class="form-group">
    <button type="submit" class="btn btn-primary" id="sendMessageButton">Send</button>
  </div>
</form>
```

Make sure you have the `email` setting in your `_config.yml` file set to a working email address! Once this is set, fill out the form and then check your email, verify the email address using the link sent to you by [Formspree](https://formspree.io/), and then the form will be working!

6. Build your site: `bundle exec jekyll serve`

### Using Core Files

When using the core files, the demo images, posts, and pages are all included with the download. After following the instructions below, you can then go and change the content of the pages and posts.

1. Clone the repository theme or download it
2. Update the following configuration settings in your `_config.yml` file:
   - `baseurl`
   - `url`
   - `title`
   - `email` (after setting this setting to a working email address, fill out the form on the contact page and send it - then check your email and verify the address and the form will send you messages when used)
   - `description`
   - `author`
   - `twitter_username` (Optional)
   - `facebook_username` (Optional)
   - `github_username` (Optional)
   - `linkedin_username` (Optional)
3. Build your site: `bundle exec jekyll serve`
