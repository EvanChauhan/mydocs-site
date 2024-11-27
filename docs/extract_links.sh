#!/bin/bash

# Exit on error
set -e

# Set the base URL of the MkDocs site
BASE_URL="http://localhost:8000/mysite/"

# Temporary files
HTML_CONTENT="site_content.html"
LINKS_FILE="extracted_links.txt"

# Start with epty files
> "$HTML_CONTENT"
> "$LINKS_FILE"

# Crawl the site and download all HTML files
function crawl_site() {
  echo "Crawling the MkDocs site at $BASE_URL..."
  wget --quiet --recursive --level=0 --no-parent --adjust-extension --convert-links \
       --no-check-certificate --execute robots=off --output-file=wget.log \
       --directory-prefix=wget_tmp "$BASE_URL"
}

# Extract all links from the downloaded HTML files
function extract_links() {
  echo "Extracting links from crawled HTML files..."

  # Find all downloaded HTML files
  find wget_tmp -name "*.html" | while read -r html_file; do
    # Extract links (href and src) from each file
    grep -Eo '(href|src)="[^"]+"' "$html_file" | sed -E 's/(href|src)="([^"]+)"/\2/' >> "$LINKS_FILE"
  done

  # Sort and remove duplicates
  sort -u -o "$LINKS_FILE" "$LINKS_FILE"
  echo "Found $(wc -l < "$LINKS_FILE") unique links."
}

# Main script execution
crawl_site
extract_links

# Display the results
echo "Links extracted to $LINKS_FILE:"
cat "$LINKS_FILE"

# Cleanup temporary files (optional)
rm -rf wget_tmp wget.log

echo "Link extraction complete."
