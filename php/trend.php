<?php

/**
 * array_count_values() does something very similar, but only works if
 * the array keys are strings or integers
 */

function count_frequency_of_values($list){
  $values_seen = array();
  foreach($list as $value){
    $value_string = (string)$value;
    if (isset($values_seen[$value_string])){
      $values_seen[$value_string] += 1;
    } else {
      $values_seen[$value_string] = 1;
    }
  }
  return $values_seen;
}

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
    $v = count_frequency_of_values($list);
    arsort($v);
    foreach($v as $k => $v) {
      $total = $k;
      break;
    }
  break;
  case 'mode_rank':
    $v = count_frequency_of_values($list);
    arsort($v);
    foreach($v as $k => $v) {
      $total[] = "$k ($v)";
    }
  break;
  case 'long_tail':
    $total = 0;
    $v = count_frequency_of_values($list);
    foreach($v as $k => $v) {
      if ($v == 1){
        $total += 1;
      }
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
  case 'log10_buckets':
    $values=array(
                  '0 to 10'         => array(),
                  '11 to 100'       => array(),
                  '101 to 1000'     => array(),
                  '1001 or greater' => array(),
                  );
    sort($list);
    foreach($list as $number){
      if ($number <= 10){
        array_push($values['0 to 10'], $number);
      } else if ($number <= 100) {
        array_push($values['11 to 100'], $number);
      } else if ($number <= 1000) {
        array_push($values['101 to 1000'], $number);
      } else {
        array_push($values['1001 or greater'], $number);
      }
      $total = sprintf(
                       "log10 buckets\n\t<10: %s\n\t11-100: %s\n\t101-1000: %s\n\t>1000: %s",
                       implode(', ', $values['0 to 10']),
                       implode(', ', $values['11 to 100']),
                       implode(', ', $values['101 to 1000']),
                       implode(', ', $values['1001 or greater'])
                       );
    }
  break;
 }
  return $total;
}

function trends_for($list) {
  return sprintf(
                 "%s\ncount of values: %s\nhigh: %.2f\nlow: %.2f\nrange: %.2f\nmean: %.2f\nmedian: %.2f\nmode: %.2f\nlong tail: %s\n\nfrequent values: %s\n\n%s",
                 implode(' ,', $list),
                 count($list),
                 trend($list, 'high'),
                 trend($list, 'low'),
                 trend($list, 'range'),
                 trend($list, 'mean'),
                 trend($list, 'median'),
                 trend($list, 'mode'),
                 trend($list, 'long_tail'),
                 implode(', ', trend($list, 'mode_rank')),
                 trend($list, 'log10_buckets')
                 );
}