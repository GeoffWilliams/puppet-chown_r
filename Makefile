# *File originally created by PDQTest*
all:
	cd .pdqtest && bundle exec pdqtest all
	$(MAKE) docs

fast:
	cd .pdqtest && bundle exec pdqtest fast

acceptance:
	cd .pdqtest && bundle exec pdqtest acceptance

shell:
	cd .pdqtest && bundle exec pdqtest --keep-container acceptance

setup:
	gem install puppet-strings
	cd .pdqtest && bundle exec pdqtest setup

shellnopuppet:
	cd .pdqtest && bundle exec pdqtest shell

logical:
	cd .pdqtest && bundle exec pdqtest logical
	$(MAKE) docs

pdqtestbundle:
	# Install all gems into _normal world_ bundle so we can use all of em
	cd .pdqtest && pwd && bundle install

docs:
	pdk bundle exec puppet strings generate --format markdown


Gemfile.local:
	echo "[🐌] Creating symlink and running pdk bundle..."
	ln -s Gemfile.project Gemfile.local
	$(MAKE) pdkbundle

pdkbundle:
	pdk bundle install

clean:
	rm -rf pkg
	rm -rf spec/fixtures/modules
