# Kalika Lyceum website

Plain static HTML served by GitHub Pages from `main` at the repo root, on the custom domain in
`CNAME`. Changes go in as a branch and a pull request.

## The Maker Portfolio URLs are permanent

`https://kalikalyceum.com/portfolio/` and every page under it have been shared publicly (including
in applications), so they must keep working no matter what else on the site changes.

- **Never move, rename or delete** anything in `portfolio/`, or change these file names:
  `index.html`, `mynabooks.html`, `metasight.html`, `bud-years.html`, `jai-siyaram.html`,
  `journeys-with-maa.html`, `frc.html`. Adding new project pages is fine.
- **The portfolio is self-contained.** Its pages use `portfolio/portfolio.css`, not the site's
  `style.css`, so a redesign of the home page or `style.css` cannot change or break it. Don't point
  portfolio pages back at shared files.
- **The home page doesn't link to the portfolio**, on purpose. A home-page cleanup must not add,
  remove or depend on anything in `portfolio/`.
- **Pages linked from the portfolio must stay put too.** `portfolio/mynabooks.html` links to
  `myna/accessibility.html`.
- **Keep `CNAME`** as `kalikalyceum.com`.

`.github/workflows/portfolio-guard.yml` enforces this: every push and pull request runs
`.github/check-portfolio.sh files`, which fails if a portfolio page is missing or a relative link
inside one is broken. Once a day, it also runs `.github/check-portfolio.sh live` against the real
site. Run the same script locally before merging anything that touches the site's structure.

## Other pages with fixed URLs

The privacy, terms, support and accessibility pages under `myna/` and `budyears/` are the URLs
registered in App Store Connect. Moving them breaks the apps' store listings.
