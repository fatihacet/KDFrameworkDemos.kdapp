# instantiate KDFrameworkDemos app
kdFwDemosView = new KDFrameworkDemosView {}, KDFrameworkDemosData
appView.addSubView kdFwDemosView

# require Ace editor
# instantiate Kodepad app
# set kodepad as an option to our app
require ["ace/ace"], (Ace)->
  kodepad = new Kodepad.Views.MainView
    cssClass: "kodepad"
    ace: Ace
    
  appView.addSubView kodepad
  kdFwDemosView.setOption "kodepad", kodepad
