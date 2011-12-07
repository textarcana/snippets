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


print "PHPUnitFileCoverage(";

print json_encode($files);

print ");";