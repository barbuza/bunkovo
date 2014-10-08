git-static = git -C bunkovo.github.io

publish: build prepare-static
	cp index.html bunkovo.github.io/
	cp -R static bunkovo.github.io/
	if [ -n "`$(git-static) status --porcelain`" ]; then $(git-static) add .; $(git-static) commit -m 'sync'; fi
	if [[ "`$(git-static) rev-parse @`" != "`$(git-static) rev-parse @{u}`" ]]; then $(git-static) push origin master; fi

build: clean
	bundle exec compass compile

clean:
	rm -rf static/images/icons-*.png
	rm -rf static/stylesheets/screen.css

prepare-static: clone-static
	cd bunkovo.github.io && git co .
	cd bunkovo.github.io && git clean -fdx

clone-static:
	if test ! -d bunkovo.github.io; then git clone git@github.com:bunkovo/bunkovo.github.io.git; fi

