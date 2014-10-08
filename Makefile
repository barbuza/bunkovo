publish: build
	git clone git@github.com:bunkovo/bunkovo.github.io.git
	cp index.html bunkovo.github.io/
	cp -R static bunkovo.github.io/
	cd bunkovo.github.io && git add . && git commit -m 'sync' && git push origin master
	rm -rf bunkovo.github.io

build: clean
	bundle exec compass compile

clean:
	rm -rf bunkovo.github.io
	rm -rf static/images/icons-*.png
	rm -rf static/stylesheets/screen.css
