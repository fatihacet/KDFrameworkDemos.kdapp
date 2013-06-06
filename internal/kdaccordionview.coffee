class KDAccordionView extends KDScrollView

  constructor: (options = {}, data) ->
    
    options.cssClass = "kdaccordionview"
    
    super options, data
    
    @panes           = []
    @visiblePanes    = []
    @activePaneIndex = 0
    
    @on "KDAccordionHandleClicked", (paneInstance) =>
      # paneInstance = @getPaneInstanceByHandle handle
      if @isPaneVisible paneInstance 
        @hidePane paneInstance
        @visiblePanes.splice @visiblePanes.indexOf paneInstance, 1
      else 
        @showPane paneInstance
        @visiblePanes.push paneInstance
      
  addPane: (paneInstance) ->
    return unless paneInstance instanceof KDAccordionPane
    
    @panes.push paneInstance
    @addSubView paneInstance
    paneInstance.pane.hide()
    
  addPanes: (arrayOfPaneInstances) ->
    return unless Array.isArray arrayOfPaneInstances
    @addPane paneInstance for paneInstance in arrayOfPaneInstances
    
  showPane: (paneInstance) ->
    paneInstance.pane.show()
    paneInstance.handle.setClass "active"
    
  hidePane: (paneInstance) ->
    paneInstance.pane.hide()
    paneInstance.handle.unsetClass "active"
  
  getActivePane: ->
    return @panes[@activePaneIndex]
    
  getPaneInstanceByHandle: (handle) ->
    return pane for pane in @panes when pane and pane.handle is handle
    
  isPaneVisible: (pane) ->
    return @visiblePanes.indexOf(pane) > -1
  
  viewAppended: ->
    super
    @prepareActivePane()
  
  prepareActivePane: (activePane = @getActivePane()) ->
    activePane.pane.show()
    activePane.handle.setClass "active"
    @visiblePanes.push activePane
