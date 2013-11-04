ContactManager.module 'ContactsApp.Show', (Show, ContactManager, Backbone, Marionette, $, _) ->
  Show.Controller =
    events:
      'click a.js-back-to-contacts': 'backToContacts'

    showContact: (id) ->
      console.log "DBG Entering Show.Controller#showContact(#{id})..."
      deferredContact = ContactManager.request 'contact:entity', id
      $.when(deferredContact).done (contact) ->
        console.log "    showContact fetch complete. Processing...", contact
        contactView = if contact
          console.log "DBG   ... fetched contact", contact
          new Show.Contact
            model: contact
        else
          console.log "DBG   ... did not fetch contact"
          new Show.missingContact()
       
        console.log contactView
        ContactManager.mainRegion.show contactView

    backToContacts: (e) ->
      ContactManager.stopEvent e
      ContactManager.navigate 'contacts'
