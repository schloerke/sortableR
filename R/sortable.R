#' Sortable.js for R
#'
#' htmlwidget that provides \href{https://github.com/SortableJS/Sortable}{Sortable.js}
#' to use for additional interactivity in the Viewer, Browser, or Shiny.
#'
#' @param selector `String` selector id on which to apply Sortable.  Note, Sortable
#'   works with any html element, not just `ul/li`.
#' @param options `list` configuration options for Sortable.  For a throrough
#'   discussion, see \href{https://github.com/SortableJS/Sortable#options}{Sortable Options}.
#'   This is the list of supported options:
#'   * `group`
#'   * `sort`
#'   * `disabled`
#'   * `store`
#'   * `animation`
#'   * `handle`
#'   * `filter`
#'   * `draggable`
#'   * `ghostClass`
#'   * `scroll`
#'   * `scrollSensitivity`
#'   * `scrollSpeed`
#'   * `setData`
#'   * `onStart`
#'   * `onEnd`
#'   * `onAdd`
#'   * `onUpdate`
#'   * `onSort`
#'   * `onRemove`
#'   * `onFilter`
#' @param width `integer` width in pixels.  Since the container is expected
#'   to not be displayed, `0` is the default.
#' @param height `integer` height in pixels.  Since the container is expected
#'   to not be displayed, `0` is the default.
#'
#' @importFrom htmlwidgets shinyWidgetOutput
#'
#' @export
sortable <- function(
  selector,
  options = NULL,
  width = 0,
  height = 0)
{

  # forward options using x
  x <- list(
    selector = selector,
    options = options
  )

  # create widget
  htmlwidgets::createWidget(
    name = "sortable",
    x,
    width = width,
    height = height,
    package = "sortable"
  )
}

#' Widget output functionA for use in Shiny.
#'
#' @inheritParams sortable
#' @param outputId output variable to use for the sortable object
#'
#' @export
sortableOutput <- function(outputId, width = "0px", height = "0px") {
  htmlwidgets::shinyWidgetOutput(outputId, "sortable", width, height, package = "sortable")
}

#' Widget render function for use in Shiny.
#'
#' @param expr An expression
#' @param env The environment in which to evaluate `expr`.
#' @param quoted Is `expr` a quoted expression (with `quote()`)? This is useful if you want to save an expression in a variable.
#'
#' @export
renderSortable <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) {
    expr <- substitute(expr)
  } # force quoted
  htmlwidgets::shinyRenderWidget(expr, sortableOutput, env, quoted = TRUE)
}
