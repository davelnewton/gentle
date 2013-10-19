app = ->
  ContactManager = new Marionette.Application()

  ContactManager.addRegions
    mainRegion: '#main-region'

  ContactManager.StaticView = Marionette.ItemView.extend
    template: '#static-template'

  ContactManager.on 'initialize:after', ->
    staticView = new ContactManager.StaticView
      template: '#different-static-template'
    ContactManager.mainRegion.show staticView

  ContactManager.start()
