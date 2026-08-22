#!/usr/bin/env bash
#
# Build (and optionally serve) the site locally, mirroring the CI build
# in .github/workflows/deploy.yml.
#
# Requirements (macOS via Homebrew + chruby):
#   brew install chruby ruby-install node
#   ruby-install ruby 3.3.5
#   npm ci  (run once after cloning)
#
# Usage:
#   bin/build-local.sh          # build once into _site/
#   bin/build-local.sh --serve  # build and serve with livereload at :4000

set -euo pipefail
cd "$(dirname "$0")/.."

set +u
for chruby_sh in /opt/homebrew/opt/chruby/share/chruby/chruby.sh /usr/local/opt/chruby/share/chruby/chruby.sh; do
    if [ -f "$chruby_sh" ]; then
        # shellcheck disable=SC1090
        source "$chruby_sh"
        break
    fi
done
chruby ruby-3.3.5
set -u

export JEKYLL_ENV=production

bundle check >/dev/null 2>&1 || bundle install
npm ci 2>/dev/null || true  # install JS deps if not already installed

if [[ "${1:-}" == "--serve" ]]; then
    bundle exec jekyll serve --livereload
else
    bundle exec jekyll build
    npm install -g purgecss 2>/dev/null || true
    purgecss -c purgecss.config.js 2>/dev/null || true
    echo "Built site into _site/"
fi
