app = ->
  ContactManager = new Marionette.Application

  ContactManager.addRegions
    mainRegion: '#main-region'
    listRegion: '#list-region'

  ContactManager.StaticView = Marionette.ItemView.extend
    id: 'static-view'
    tagName: 'span'
    className: 'instruction'
    template: '#static-template'

  ContactManager.ListView = Marionette.ItemView.extend
    tagName: 'ul'
    template: '#list-template'

  ContactManager.on 'initialize:after', ->
    staticView = new ContactManager.StaticView
      template: '#different-static-template'
    ContactManager.mainRegion.show staticView
    ContactManager.listRegion.show new ContactManager.ListView

  ContactManager.start()
