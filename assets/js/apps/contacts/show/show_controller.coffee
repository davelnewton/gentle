ContactManager.module 'ContactsApp.Show', (Show, ContactManager, Backbone, Marionette, $, _) ->
  Show.Controller =
    events:
      'click a.js-back-to-contacts': 'backToContacts'

    # XXX TODO Show.Contact.viewFor
    showContact: (id) ->
      console.log "DBG Entering Show.Controller#showContact(#{id})..."
      contact = ContactManager.request 'contact:entity', id
      contactView = if contact
        new Show.Contact
          model: contact
      else
        new Show.missingContact()
     
      console.log contactView
      ContactManager.mainRegion.show contactView

    backToContacts: (e) ->
      ContactManager.stopEvent e
      ContactManager.navigate 'contacts'
