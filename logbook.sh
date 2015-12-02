#!/usr/local/bin/zsh
file="`date +%b-%d-%Y`.md"
if [ -f "$file" ]
then
  vim "$file"
else
  echo "# `date +%A,\ %B\ %-d,\ %Y` Log\n\n\n## Summary\n\n\n## Questions\n\n\n## Learned\n\n\n## Log\n\n" >> "$file" && vim "$file"
fi
