ContactManager.module 'ContactsApp.Show', (Show, ContactManager, Backbone, Marionette, $, _) ->
  Show.Controller =
    events:
      'click a.js-back-to-contacts': 'backToContacts'

    # XXX TODO Show.Contact.viewFor
    showContact: (id) ->
      console.log "DBG Entering Show.Controller#showContact(#{id})..."
      contacts = ContactManager.request 'contact:entities'
      model = contacts.get id
      contactView = new Show.Contact
        model: model
     
      ContactManager.mainRegion.show contactView

    backToContacts: (e) ->
      ContactManager.stopEvent e
      ContactManager.navigate 'contacts'
