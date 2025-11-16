<?php
header('Content-Type: text/plain; charset=utf-8');

echo "=== PHP Information ===\n";
echo "PHP Version: " . phpversion() . "\n";
echo "Server Time: " . date('Y-m-d H:i:s') . "\n";
echo "Memory Limit: " . ini_get('memory_limit') . "\n";

echo "\n=== Loaded Extensions ===\n";
$extensions = get_loaded_extensions();
sort($extensions);
echo implode(', ', $extensions);

echo "\n\n=== Server Info ===\n";
echo "Software: " . ($_SERVER['SERVER_SOFTWARE'] ?? 'N/A') . "\n";
echo "Document Root: " . ($_SERVER['DOCUMENT_ROOT'] ?? 'N/A') . "\n";

echo "\n✅ PHP is working correctly with Nginx!";
?>