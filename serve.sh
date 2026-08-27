#!/usr/bin/env bash
set -e
user_gem_home="$(ruby -e 'print Gem.user_dir')"
user_gem_bindir="$(ruby -e 'print Gem.bindir')"
system_gem_path="$(ruby -e 'print Gem.path.join(":" )')"
export GEM_HOME="$user_gem_home"
export GEM_PATH="$user_gem_home:$system_gem_path"
export PATH="$user_gem_bindir:$PATH"
if ! command -v jekyll >/dev/null 2>&1; then
  echo "Installing jekyll into $GEM_HOME (requires Ruby)"
  gem install --user-install jekyll bundler
fi
if ! gem list -i jekyll-theme-cayman >/dev/null 2>&1; then
  echo "Installing jekyll-theme-cayman into $GEM_HOME (requires Ruby)"
  gem install --user-install jekyll-theme-cayman
fi
jekyll serve --watch --livereload
