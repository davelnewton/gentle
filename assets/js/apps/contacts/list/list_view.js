ContactManager.module('ContactsApp.List', function(List, ContactManager, Backbone, Marionette, $, _) {
  List.Contact = Marionette.ItemView.extend({
    tagName: 'tr',
    template: '#contact-list-item',
    events: {
      'click': 'highlightName',
      'click td a.js-show': 'showContact',
      'click button.js-delete': 'deleteContact'
    },
    highlightName: function(e) {
      return this.$el.toggleClass('warning');
    },
    deleteContact: function(e) {
      ContactManager.stopEvent(e);
      return this.trigger('contact:delete', this.model);
    },
    showContact: function(e) {
      ContactManager.stopEvent(e);
      console.log('DBG list_view showContact handler...');
      return this.trigger('contact:show', this.model);
    },
    remove: function() {
      var self;
      self = this;
      return this.$el.fadeOut(function() {
        return Marionette.ItemView.prototype.remove.call(self);
      });
    }
  });
  return List.Contacts = Marionette.CompositeView.extend({
    tagName: 'table',
    className: 'table table-hover',
    template: '#contact-list',
    itemView: List.Contact,
    itemViewContainer: 'tbody',
    onItemviewContactDelete: function(arg0) {
      var fullName, model;
      model = arg0.model;
      fullName = "" + (model.get('firstName')) + " " + (model.get('lastName'));
      return $.jGrowl("Deleted " + fullName, {
        life: 1000
      });
    }
  });
});
