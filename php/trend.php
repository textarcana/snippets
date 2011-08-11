|<?php
/**
 * Trend function is from http://phpsnips.com/snippet.php?id=45 
 */

function trend($array, $output) { 
  if (!is_array($array)) { 
    return false; 
  }
  switch($output) { 
  case 'mean': 
      $count = count($array); 
      $sum = array_sum($array); 
      $total = $sum / $count; 
      break; 
  case 'median': 
    rsort($array); 
    $middle = round(count($array) / 2); 
    $total = $array[$middle-1]; 
    break; 
  case 'mode': 
    $v = array_count_values($array); 
    arsort($v); 
    foreach($v as $k => $v) {$total = $k; break; } 
    break; 
  case 'range': 
    sort($array); 
    $sml = $array[0]; 
    rsort($array); 
    $lrg = $array[0]; 
    $total = $lrg - $sml; 
    break; 
    return $total; 

  } 

  function trends_for($list) {
    return sprintf(
                   "%s\nmean: %f\nmedian: %f\nmode: %f\nrange: %f", 
                   implode(' ,', $list), 
                   trend($list, 'mean'), 
                   trend($list, 'median'), 
                   trend($list, 'mode'), 
                   trend($list, 'range'));
  }