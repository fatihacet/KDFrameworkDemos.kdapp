KD.enableLogs()

class KDFrameworkDemosView extends JView

  constructor: (options = {}, data) ->
    
    options.cssClass = "kdframeworkdemos"
    
    super options, data
    
    @accordionView = new KDAccordionView
    
    data = @getData()
    for topic of data
      childView  = new KDView
        cssClass : "demo-item-container"
        
      for item in data[topic]
        childView.addSubView new KDFrameworkDemoItem 
          delegate: @
        , item
        
      @accordionView.addPane pane = new KDAccordionPane {
        handleTitle : topic
        childView
      }
    
  pistachio: ->
    """
      {{> @accordionView}}
    """

class KDFrameworkDemoItem extends JView
    
  constructor: (options = {}, data) ->
    
    options.cssClass = "demo-item"
    
    super options, data
    
    @thumbnail = new KDCustomHTMLView
      tagName    : "img"
      attributes :
        src      : @getData().thumbnail
      click      : =>
        @getDelegate().hide()
        {ace} = @getDelegate().getOptions().kodepad
        ace.setValue """
          appView.addSubView new KDView({
            partial: "Hello World!"
          })
        """
        
    @header = new KDCustomHTMLView
      tagName : "h2"
      partial : @getData().title
      
    @description = new KDView
      partial : @getData().description
        
  pistachio: -> 
    """
      {{> @thumbnail}}
      {{> @header}}
      {{> @description}}
    """