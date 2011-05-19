function humanizeTimestamp(raw_timestamp) {
  timestamp = new Date(parseInt(raw_timestamp));
  return timestamp.toLocaleString().match('(.*):[^:]+$')[1];
}

function humanizeDuration(raw_timestamp) {
    duration = (Date.now() - (raw_timestamp));

    time_in_seconds = Math.round(duration / 1000);

    if (time_in_seconds < 60) {
        return (time_in_seconds).toString() + 's';
    } else if (time_in_seconds < 3600) {
        return Math.round(time_in_seconds / 60).toString() + 'm';
    } else if (time_in_seconds < 86400) {
        return Math.round(time_in_seconds / 3600).toString() + 'h';
    } else {
        return Math.round(time_in_seconds / 86400).toString() + 'd';
    };

    return (Math.round(duration / (60 * 1000))).toString() + ' minutes ago';
}

