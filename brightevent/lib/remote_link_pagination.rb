module RemoteLinkPagination 
    class LinkRenderer < BootstrapPagination::Rails
      def link(text, target, attributes = {})
        attributes['data-remote'] = true
        super
      end
  
      def gap
        tag :li, tag(:span, '&hellip;', class: 'gap'), 'data-go-to-page': true
      end
    end
  end