module ApplicationHelper
=begin
  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, params.merge(:sort => column, :direction => direction, :page => nil), {:class => css_class}
  end
=end
=begin
  class RemoteLinkerRender < WillPaginate::ViewHelpers::LinkRenderer
    def link(text ,target,attributes ={})
      attributes["data-remote"]=true
      super
    end
  end
=end
end
