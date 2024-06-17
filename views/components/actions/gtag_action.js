{
  window.gtag_action = function gtag_action(_options, params, _event, results) {
    const {event_name: name, event_data: data, signature} = params

    if (hasSentEvent(signature)) {
      console.debug("gtag_action: skip", signature)
    }
    else {
      console.debug("gtag_action: send", signature, name, data)

      gtag("event", name, data)
      storeEventSend(signature)
    }

    results.push({
      action: "action",
      content: JSON.stringify({data: params}),
      statusCode: 200,
    })

    return Promise.resolve(results)
  }

  const EVENTS_KEY = "COPRL-GA-events"

  function getSentEvents() {
    const json = localStorage.getItem(EVENTS_KEY)

    try {
      return JSON.parse(json) || []
    }
    catch /* SyntaxError */ {
      // ignored
    }

    return []
  }

  function storeEventSend(signature) {
    if (!signature) {
      return
    }

    const events = getSentEvents()
    events.push(signature)

    try {
      localStorage.setItem(EVENTS_KEY, JSON.stringify(events))
    }
    catch (err) {
      if (err instanceof DOMException && err.name == "QuotaExceededError") {
        // ignored – key presence is nonessential for plugin functionality.
      } else {
        throw err
      }
    }
  }

  function hasSentEvent(signature) {
    if (!signature) {
      return false
    }

    return getSentEvents().includes(signature)
  }
}
