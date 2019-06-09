#' Returns the price of x USD in EUR
#' @param x the usd amount to convert to EUR
#' @param decimals precision of rounding in decimals
#' @export
#' @return integer
#' @examples
#' convert_usd_to_eur(100)
#' convert_usd_to_eur(20, 5)

convert_usd_to_eur <- function(x, decimals = 3) {
  rate <- eurusd(decimals)
  rate * x
}

