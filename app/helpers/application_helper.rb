# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def table_for(collection=[],options={},&block)
    c = ""
    c << "<table class='list_table #{options[:class]}'>"
    collection.each_with_index { |item,index|
      row = block.call(item, TableColumn.new(index))
      if index == 0
        unless options[:ignore_header]
          head = row.head.map{|i| i[0].to_s}
          c << "<thead><tr><th>" + head.join("</th><th>") + "</th></tr></thead>"
        end
        c << "<tbody>"
      end
      content = row.content.map{|i| i.class==Symbol ? item.try(i) : i}
      c << "<tr#{" class='even'" if index.even?}><td>" +  content.join("</td><td>") + "</td></tr>"
    }
    c << "</tbody></table>"
    c << paginate_links(collection)
    c
  end
  
  def paginate_links(collection, table_name = nil)
    c = %{<div class="list_table_page">}
    if collection.respond_to?(:total_entries)
      c << "Total : #{collection.total_entries}"
      c << (will_paginate(collection, :previous_label=>"previous_page", :next_label=>"next_page") || "")
    else
      c << "Total : #{collection.size}"
    end
    c << "</div>"
  end
  
  def notice(info=flash[:notice])
    unless info.blank?
        return %{<div id="notice" class="noticebox">
        <span style="float:right">#{link_to_function image_tag("del.gif"),"Element.hide('notice')"}</span>           
          #{info}
        </div>}
      end

  end
  
  
  class TableColumn
    attr_reader :head, :content, :index
    def initialize(_index, request = nil)
      @head, @content, @index = [], [], _index
    end
    def add(*args)
      @head << [i = args.shift, args.extract_options!]
      @content << (args.size > 0 ? args.join("") : i)
      self
    end
    def build(*attrs)
      attrs.each{|t| self.add(t)}
      self
    end
    def first?
      @index == 0
    end
  end
  
  
  def view_tabs(selected_index = 1, &block)
    concat(%{<div id="tabViews">})
    yield
    concat(%{</div>})
    unless @view_tab_names.blank?
      concat(%{<script type="text/javascript">
                  initTabs('tabViews',Array(#{@view_tab_names.join(",")}),#{(selected_index||1).to_i - 1}, '100%', '100%');
              </script>})
    end
  end
  
  def view_tab(title, &block)
    @view_tab_names ||= []
    @view_tab_names << "'#{title}'"
    concat(%{<div class="dhtmlgoodies_aTab">})
    yield
    concat(%{</div>})
  end
  
  
  
end
