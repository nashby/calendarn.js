[![Build Status](https://travis-ci.org/nashby/calendarn.js.png?branch=master)](https://travis-ci.org/nashby/calendarn.js)
### Calendarn.js

Create events in various calendars easily.

#### Usage

```coffeescript
calendarn = new Calendarn(options)

# Google Calendar
calendarn.google()

# iCalendar
calendarn.iCalendar()
```

To create link to downloadable iCalc file you can use [Data URI scheme](http://en.wikipedia.org/wiki/Data_URI_scheme)

```coffeescript
encodeURI("data:text/calendar;charset=utf8,#{calendarn.iCalendar()}")
```

and then add to `href` attribute of the link.

Options:

```
startDate
endDate
title
description
location
url (for iCalendar)
```

#### Developing

```
npm test
```

#### Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
