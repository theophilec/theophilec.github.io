#!/usr/bin/env bash
#
# Build (and optionally serve) the site locally, mirroring the CI build
# in .github/workflows/deploy.yml. Requires chruby with ruby-3.3.5 and
# Homebrew llvm (for mini_racer's native extension) to be installed:
#   brew install chruby ruby-install llvm
#   ruby-install ruby 3.3.5
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

export CC=/opt/homebrew/opt/llvm/bin/clang
export CXX=/opt/homebrew/opt/llvm/bin/clang++
export JEKYLL_ENV=production

bundle check >/dev/null 2>&1 || bundle install

if [[ "${1:-}" == "--serve" ]]; then
    bundle exec jekyll serve --lsi --livereload
else
    bundle exec jekyll build --lsi
    echo "Built site into _site/"
fi
