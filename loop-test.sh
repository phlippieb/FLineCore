while [ 1 ]; do
   # Wait
   read

   # Test and show passed or failed
   swift test && echo "\nPassed" || echo "\nFailed"
done
