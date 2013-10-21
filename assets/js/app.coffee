ContactManager = new Marionette.Application
console.log 'DBG Created ContactManager', ContactManager

ContactManager.addRegions
  mainRegion: '#main-region'

ContactManager.on 'initialize:after', ->
  console.log 'DBG Main initialize:after handler enter...'
  Backbone.history.start() if Backbone.history

  console.log "DBG Checking fragment; '#{Backbone.history.fragment}' (#{!!Backbone.history.fragment})..."
  unless !!Backbone.history.fragment
    Backbone.history.navigate('contacts')
    ContactsApp.List.Controller.listContacts()

window.ContactManager = ContactManager
