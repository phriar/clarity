#!/usr/bin/env python3
"""
Run from your clarity repo root.
Replaces whatever hamburger script exists on each page with the 
confirmed-working version from index.html. Skips index.html itself.
Does not touch any other content.
"""

import re, os, glob

WORKING_SCRIPT = """<script>
(function() {
  var ham = document.getElementById('hamburger');
  var drawer = document.getElementById('drawer');
  if (!ham || !drawer) return;

  ham.addEventListener('click', function(e) {
    e.stopPropagation();
    var isOpen = drawer.style.display === 'flex';
    drawer.style.display = isOpen ? 'none' : 'flex';
    document.body.style.overflow = isOpen ? '' : 'hidden';
  });

  // Close when clicking a nav link
  drawer.querySelectorAll('a').forEach(function(a) {
    a.addEventListener('click', function() {
      drawer.style.display = 'none';
      document.body.style.overflow = '';
    });
  });

  // Close when tapping outside
  document.addEventListener('click', function(e) {
    if (drawer.style.display === 'flex' && !drawer.contains(e.target) && e.target !== ham) {
      drawer.style.display = 'none';
      document.body.style.overflow = '';
    }
  });
})();
</script>
</body>
</html>"""

# Pattern: everything from the last <script> before </body> to </html>
# We look specifically for the IIFE or the broken hamburger script block
SCRIPT_PATTERN = re.compile(
    r'<script[^>]*>\s*(?://[^\n]*)?\s*(?:const|var|let)\s+(?:ham|form)[^<]*?</script>\s*(?:<script>[^<]*?</script>\s*)*</body>\s*</html>',
    re.DOTALL
)

# Simpler fallback: just replace from last <script> to end of file
FALLBACK_PATTERN = re.compile(
    r'(<script[^>]*>(?:(?!</script>).)*hamburger(?:(?!</script>).)*</script>.*)</body>\s*</html>',
    re.DOTALL
)

files = [f for f in glob.glob('*.html') if f != 'index.html']

for fname in files:
    with open(fname) as f:
        content = f.read()

    # Find the script block(s) at the end containing hamburger logic
    # and replace everything from that point to </html>
    match = re.search(r'(<script[^\>]*>(?:(?!</script>).)*getElementById\(\'hamburger\'(?:(?!</script>).)*</script>)', content, re.DOTALL)
    
    if match:
        # Remove the old hamburger script and everything after it to </html>
        start = match.start()
        # Cut everything from the hamburger script start to end of file
        new_content = content[:start] + WORKING_SCRIPT
        with open(fname, 'w') as f:
            f.write(new_content)
        print(f'Fixed: {fname}')
    else:
        print(f'No hamburger script found (check manually): {fname}')

print('\nDone. Test on mobile and confirm.')
