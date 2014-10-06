build: clean
	bundle exec compass compile

clean:
	rm -rf static/images/icons-*.png
	rm -rf static/stylesheets/screen.css
