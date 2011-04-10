function humanizeTimestamp(raw_timestamp) {
  timestamp = new Date(parseInt(raw_timestamp));
  return timestamp.toLocaleString().match('(.*):[^:]+$')[1];
}

function humanizeDuration(raw_timestamp) {
    timestamp = new Date(parseInt(raw_timestamp));
    duration = (Date.now() - (timestamp));
    return (Math.round(duration / (60 * 1000))).toString() + ' minutes ago';
}
