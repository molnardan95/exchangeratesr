#' Returns the price of 1 USD in EUR
#' @param decimals precision of rounding in decimals
#' @export
#' @return integer
#' @importFrom httr GET
#' @importFrom httr content
#' @examples
#' eurusd()
#' eurusd(1)


eurusd <- function(decimals = 3) {
  API_USD <- GET('https://api.exchangeratesapi.io/latest?base=USD')
  exchange_rates <- content(API_USD)
  round(exchange_rates$rates$EUR, decimals)
}

