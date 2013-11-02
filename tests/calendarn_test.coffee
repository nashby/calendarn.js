assert    = require("assert")
{Calendarn} = require '../src/calendarn'

describe 'Calendarn', ->
  before ->
    @options = {}
    @options.startDate   = new Date(Date.UTC(2013, 10, 5))
    @options.endDate     = new Date(Date.UTC(2013, 10, 6))
    @options.title       = "Forrester's Forum For eBusiness & Channel Strategy Professionals"
    @options.description = "FooBar"
    @options.location    = "Belarus, Minsk"
    @options.url         = "http://example.org"

    @calendarn = new Calendarn @options

  it 'returns query for google calendar', ->
    expected = "https://www.google.com/calendar/render?action=TEMPLATE&text=Forrester's+Forum+For+eBusiness+%26+Channel+Strategy+Professionals&details=FooBar&location=Belarus%2C+Minsk&dates=20131105T000000Z/20131106T000000Z"

    assert.equal expected, do @calendarn.google

  it 'returns data for iCalendar format', ->
    expected = """
      BEGIN:VCALENDAR
      VERSION:2.0
      BEGIN:VEVENT
      URL:http://example.org
      DTSTART:20131105T000000Z
      DTEND:20131106T000000Z
      SUMMARY:Forrester's Forum For eBusiness & Channel Strategy Professionals
      DESCRIPTION:FooBar
      LOCATION:Belarus, Minsk
      END:VEVENT
      END:VCALENDAR
    """

    assert.equal expected, do @calendarn.iCalendar
