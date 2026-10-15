# Kalika Lyceum website

Minimal static site for GitHub Pages with:
- Home page
- Privacy Policy
- Terms & Conditions
- Disclaimer

## Files
- `index.html`
- `privacy-policy.html`
- `terms.html`
- `disclaimer.html`
- `style.css`

## Custom domain
Add a file named `CNAME` containing:

kalikalyceum.com

Then configure the custom domain in GitHub Pages settings.

## Permanent URLs

`/portfolio/` (the Maker Portfolio) and the app pages under `/myna/` and `/budyears/` are linked
from outside this site and must never move. See `CLAUDE.md` for the rules. The **Portfolio guard**
GitHub Action checks them on every change and on the live site daily.
