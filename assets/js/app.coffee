ContactManager = new Marionette.Application
console.log 'DBG Created ContactManager', ContactManager

ContactManager.addRegions
  mainRegion: '#main-region'

ContactManager.navigate = (route, options) ->
  options || (options = {})
  Backbone.history.navigate route, options

ContactManager.currentRoute = ->
  Backbone.history.fragment

ContactManager.on 'initialize:after', ->
  console.log 'DBG Main initialize:after handler enter...'
  Backbone.history.start() if Backbone.history

  console.log "DBG Checking fragment; '#{@currentRoute()}' (#{!!@currentRoute()})..."
  ContactManager.trigger 'contacts:list' unless !!@currentRoute()

window.ContactManager = ContactManager
