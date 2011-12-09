<?php

$files = array();
$files['with tests'] = array();
$files['not tested'] = array();

$sub_dir = count($argv) > 3 ? '/' . $argv[3] : '';

$iterator = new RecursiveIteratorIterator(
    new RecursiveDirectoryIterator(
        $argv[1] . $sub_dir
    )
);

foreach ($iterator as $path) {
    if ($path->isFile()) {
        $test = $argv[2]
            . str_replace($argv[1], '', $path->getPath())
            . '/'
            . $path->getBasename('.php')
            . 'Test.php';
        if (file_exists($test) === false) {
            $files['not tested'][] = $path->getPathname();
        } else {
            $files['with tests'][] = $path->getPathname();
        }
    }
}

$percent_tested = 100 * (count($files['with tests']) / (count($files['not tested']) + count($files['with tests'])));

echo count($files['not tested']) . " untested PHP class files files in " . $argv[1] . ".\n";

echo count($files['with tests']) . " tested PHP class files.\n";

echo number_format($percent_tested,2)." % of PHP class files are under test.";
