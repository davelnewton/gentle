ContactManager = new Marionette.Application

ContactManager.addRegions
  mainRegion: '#main-region'

app = ->
  ContactManager.ContactItemView = Marionette.ItemView.extend
    tagName: 'li'
    template: '#contact-list-item'

  ContactManager.ContactsView = Marionette.CollectionView.extend
    tagName: 'ul'
    itemView: ContactManager.ContactItemView

  ContactManager.on 'initialize:after', ->
    contactsListView = new ContactManager.ContactsView
      collection: ContactManager.request 'contact:entities'

    ContactManager.mainRegion.show contactsListView

  ContactManager.start()
