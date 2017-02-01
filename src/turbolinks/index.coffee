#= require ./BANNER
#= export Turbolinks
#= require_self
#= require ./helpers
#= require ./controller
#= require ./start

@Turbolinks =
  supported: do ->
    window.history.pushState? and
      window.requestAnimationFrame? and
      window.addEventListener?

  visit: (location, options) ->
    Turbolinks.controller.visit(location, options)

  clearCache: ->
    Turbolinks.controller.clearCache()

  changeURL: (location, options = {}) ->
    method = if "replace" == (options.action ? 'advance') then 'replaceHistoryWithLocationAndRestorationIdentifier' else 'pushHistoryWithLocationAndRestorationIdentifier'
    Turbolinks.controller[method](location, Turbolinks.uuid())
