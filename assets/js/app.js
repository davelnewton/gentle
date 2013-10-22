(function() {
  var ContactManager;

  ContactManager = new Marionette.Application;

  console.log('DBG Created ContactManager', ContactManager);

  ContactManager.addRegions({
    mainRegion: '#main-region'
  });

  ContactManager.navigate = function(route, options) {
    options || (options = {});
    return Backbone.history.navigate(route, options);
  };

  ContactManager.currentRoute = function() {
    return Backbone.history.fragment;
  };

  ContactManager.stopEvent = function(e) {
    e.preventDefault();
    return e.stopPropagation();
  };

  ContactManager.on('initialize:after', function() {
    console.log('DBG Main initialize:after handler enter...');
    if (Backbone.history) {
      Backbone.history.start();
    }
    console.log("DBG Checking fragment; '" + (this.currentRoute()) + "' (" + (!!this.currentRoute()) + ")...");
    if (!this.currentRoute()) {
      return ContactManager.trigger('contacts:list');
    }
  });

  window.ContactManager = ContactManager;

}).call(this);
