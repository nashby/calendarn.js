do (exports) ->
  class Calendarn
    constructor: (@options) ->
      @startDate = @formatDate(@options.startDate)
      @endDate   = @formatDate(@options.endDate)

    google: ->
      params =
        action:  'TEMPLATE'
        text:     @options.title
        details:  @options.description || ''
        location: @options.location    || ''

      "https://www.google.com/calendar/render?#{@parametrize(params)}&dates=#{@startDate}/#{@endDate}"

    iCalendar: ->
      [
        "BEGIN:VCALENDAR"
        "VERSION:2.0"
        "BEGIN:VEVENT"
        "URL:#{@options.url || ''}"
        "DTSTART:#{@startDate}"
        "DTEND:#{@endDate}"
        "SUMMARY:#{@options.title || ''}"
        "DESCRIPTION:#{@options.description}"
        "LOCATION:#{@options.location || ''}"
        "END:VEVENT"
        "END:VCALENDAR"
      ].join('\n')

    formatDate: (date) ->
      date = new Date(date) unless date instanceof Date
      date.toISOString().replace(/-|:|\.\d+/g, '')

    parametrize: (params) ->
      encoded = []

      for key, value of params
        encoded.push "#{encodeURIComponent(key)}=#{encodeURIComponent(value)}"

      encoded.join('&').replace(/%20/g, '+')

  exports.Calendarn = Calendarn
