#' Returns value in formatted with euro symbol
#' @param x the amount to transform with eur symbol
#' @export
#' @return string
#' @examples
#' eur(1000)
#' eur(4242.4242)

eur <- function(x){
  x <- round(x, 2)
  eur <- format(x, big.mark=",")

  if(x < 0){
    output <- paste0('-€', substring(as.character(eur),2))
  } else {
    output <- paste0('€', as.character(eur))
  }

  return(output)
}

