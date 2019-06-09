#' Returns value withouth eur curreny sign
#' @param x eur value with currency sign
#' @export
#' @return integer
#' @examples
#' uneur('€4,242.42')
#' uneur('-€4,242')
#' uneur(eur(1000))
#' @seealso eur()

uneur <- function(x) {
  if(substring(x, 0, 1) == '-'){
    -as.numeric(gsub(',', '', substring(x, 3)))
  } else {
    as.numeric(gsub(',', '', substring(x, 2)))
  }
}
