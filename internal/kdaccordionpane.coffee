class KDAccordionPane extends JView

  constructor: (options = {}, data) ->
    
    options.cssClass = "kdaccordionpaneview"
    
    super options, data
    
    HandleClass  = @getOptions().paneHandleClass or KDAccordionPaneHandle
    @handle      = new HandleClass
      title      : @getOptions().handleTitle
      click      : =>
        delegate = @getDelegate() or @parent
        delegate.emit "KDAccordionHandleClicked", @
        
    @paneContainer = new KDView
      cssClass   : "kdaccordionpane"
      
    {childView} = @getOptions()
    if childView and childView instanceof KDView
      @paneContainer.addSubView @pane = childView
    else 
      @paneContainer.addSubView @pane = new KDView
        partial    : @getOptions().partial
      
  pistachio: ->
    """
      {{> @handle}}
      {{> @paneContainer}}
    """