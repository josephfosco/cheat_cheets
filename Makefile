install:
	bundle config set path 'vendor/bundle'
	bundle install

build:
	bundle exec jekyll build

serve:
	bundle exec jekyll serve
