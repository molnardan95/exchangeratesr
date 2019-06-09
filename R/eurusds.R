#' Returns the historical price of 1 USD in EUR
#' @param date_from first date of the examined period
#' @param date_to last date of the examined period
#' @param decimals precision of rounding in decimals
#' @export
#' @return integer
#' @importFrom data.table data.table
#' @importFrom lubridate ymd
#' @importFrom logger log_info
#' @importFrom httr GET
#' @importFrom httr content
#' @examples
#' eurusds('2019-01-01', '2019-02-01')
#' eurusd('2019-01-01', '2019-02-01', 5)


eurusds <- function(date_from, date_to, decimals = 3) {
  date_from <- ymd(date_from)
  date_to <- ymd(date_to)

  if(date_from > date_to | date_to > Sys.Date()) {
    log_info('Error: The date range you entered is not valid')
    stop()
  }

  API_USD <- GET(
    'https://api.exchangeratesapi.io/history',
    query = list(
      start_at = date_from,
      end_at = date_to,
      base = 'USD',
      symbols = 'EUR'
    )
  )

  exchange_rates <- content(API_USD)
  rates <- exchange_rates$rates

  output <- data.table(
    date = as.Date(names(rates)),
    eurusd = round(as.numeric(unlist(rates)), decimals)
  )

  # Need all the dates, no values for weekend
  dates <- data.table(date = as.Date(seq(date_from, date_to, 'day')))
  output <- output[order(date)]

  setkey(output, date)
  setkey(dates, date)

  # Rolling join
  output <- output[dates, roll = TRUE]

  return(output)
}

