// This event callback pushes its results into the results array and returns a promise.
function gtag_action(_options, params, _event, results) {
  var promiseObj = new Promise(function(resolve) {
    gtag('event', params.event_name, params.event_data)
    results.push({
      action: 'action',
      content: JSON.stringify({data: params}),
      statusCode: 200,
    });
    resolve(results);
  });
  return promiseObj;
}
