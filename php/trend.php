|<?php
   /**
    * Trend function is from http://phpsnips.com/snippet.php?id=45 
    */

function trend($list, $type) { 
  if (!is_array($list)) { 
    return false; 
  }
  switch($type) { 
  case 'mean': 
    $count = count($list); 
    $sum = array_sum($list); 
    $total = $sum / $count; 
  break; 
  case 'median': 
    rsort($list); 
    $middle = round(count($list) / 2); 
    $total = $list[$middle-1]; 
  break; 
  case 'mode': 
    $v = array_count_values($list); 
    arsort($v); 
    foreach($v as $k => $v) {
      $total = $k; 
      break; 
    } 
  break; 
  case 'range': 
    sort($list); 
    $small = $list[0]; 
    rsort($list); 
    $large = $list[0]; 
    $total = $large - $small; 
  break; 
  case 'low':
    $total = min($list);
  break;
  case 'high':
    $total = max($list);
  break;
 }
  return $total; 
}

function trends_for($list) {
  return sprintf(
                 "%.2s\nmean: %.2f\nmedian: %.2f\nmode: %.2f\nrange: %.2f\nlow: %.2f\nhigh: %.2f", 
                 implode(' ,', $list), 
                 trend($list, 'mean'), 
                 trend($list, 'median'), 
                 trend($list, 'mode'), 
                 trend($list, 'range'),
                 trend($list, 'low'),
                 trend($list, 'high')
                 );
}