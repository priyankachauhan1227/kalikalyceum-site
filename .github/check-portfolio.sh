#!/usr/bin/env bash
# Guards the Maker Portfolio's permanent URLs (see CLAUDE.md).
#   check-portfolio.sh files   every portfolio page exists and every relative link in it resolves
#   check-portfolio.sh live    every portfolio URL answers 200 on kalikalyceum.com
set -u
PAGES="index.html mynabooks.html metasight.html bud-years.html jai-siyaram.html journeys-with-maa.html frc.html"
fail=0

case "${1:-files}" in
files)
  for p in $PAGES; do
    [ -f "portfolio/$p" ] || { echo "MISSING: portfolio/$p"; fail=1; }
  done
  grep -qx 'kalikalyceum.com' CNAME 2>/dev/null || { echo "CNAME must contain kalikalyceum.com"; fail=1; }
  for f in portfolio/*.html; do
    # Strip HTML comments first: they hold templates for links that don't exist yet.
    for ref in $(perl -0pe 's/<!--.*?-->//gs' "$f" | grep -oE '(href|src)="[^"]+"' \
                 | sed -E 's/^[a-z]+="//; s/"$//' | grep -vE '^(https?:|mailto:|#)'); do
      [ -e "$(dirname "$f")/${ref%%#*}" ] || { echo "BROKEN LINK in $f: $ref"; fail=1; }
    done
  done
  ;;
live)
  for p in "" $PAGES; do
    code=$(curl -s -o /dev/null -w '%{http_code}' --retry 3 --retry-delay 20 "https://kalikalyceum.com/portfolio/$p")
    echo "$code /portfolio/$p"
    [ "$code" = 200 ] || fail=1
  done
  ;;
*) echo "usage: $0 files|live"; exit 2 ;;
esac

[ $fail = 0 ] && echo "Portfolio OK"
exit $fail
