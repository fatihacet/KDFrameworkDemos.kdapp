class KDAccordionPaneHandle extends JView
  
  constructor: (options = {}, data) ->
    
    options.tagName   = "span"
    options.cssClass  = "kdaccordionhandle"
    
    super options, data
    
    @icon  = new KDCustomHTMLView
      tagName  : "span"
      cssClass : "icon"
    
    @title = new KDCustomHTMLView
      tagName  : "span"
      cssClass : "kdaccordiontitle"
      partial  : @getOptions().title
      
  pistachio: ->
    """
      {{> @icon}}
      {{> @title}}
    """