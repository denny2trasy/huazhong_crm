require 'action_view/helpers/tag_helper'

module InPlaceMacrosHelper
  
  alias_method :in_place_editor_field_old , :in_place_editor_field
  
  def column_boolean?(mod,col)
    index = mod.to_s.camelize.constantize.columns.map{|o| o.name}.index(col.to_s)
    index && mod.to_s.camelize.constantize.columns[index].type.to_s == "boolean"
  end
  
  def in_place_editor_field(object, method, tag_options = {}, in_place_editor_options = {})
    if column_boolean?(object, method) || in_place_editor_options[:collection]
      in_place_drop_down_list_field object, method, tag_options , in_place_editor_options
    else
      in_place_editor_field_old object, method, tag_options , in_place_editor_options 
    end
  end
  
  def in_place_drop_down_list_field(object, method, tag_options = {}, in_place_editor_options = {})
    tag = ::ActionView::Helpers::InstanceTag.new(object, method, self)
    tag_options = {:tag => "span", :id => "#{object}_#{method}_#{tag.object.id}_in_place_editor", :class => "in_place_editor_field"}.merge!(tag_options)
    in_place_editor_options[:url] = in_place_editor_options[:url] || url_for({ :action => "set_#{object}_#{method}", :id => tag.object.id })
    tag.to_content_tag(tag_options.delete(:tag), tag_options) + in_place_drop_down_list_editor(tag_options[:id], in_place_editor_options)        
  end
  
  
  def in_place_drop_down_list_editor(field_id, options = {})
    function =  "new Ajax.InPlaceCollectionEditor("
    function << "'#{field_id}', "
    function << "'#{url_for(options[:url])}',"
    default_collection = "[false,true]"
    function << "{collection: #{options[:collection] ? options[:collection].to_json : default_collection}}"
    js_options = {}
    js_options['cancelText'] = %('#{options[:cancel_text]}') if options[:cancel_text]
    js_options['okText'] = %('#{options[:save_text]}') if options[:save_text]
    js_options['loadingText'] = %('#{options[:loading_text]}') if options[:loading_text]
    js_options['savingText'] = %('#{options[:saving_text]}') if options[:saving_text]
    js_options['rows'] = options[:rows] if options[:rows]
    js_options['cols'] = options[:cols] if options[:cols]
    js_options['size'] = options[:size] if options[:size]
    js_options['externalControl'] = "'#{options[:external_control]}'" if options[:external_control]
    js_options['loadTextURL'] = "'#{url_for(options[:load_text_url])}'" if options[:load_text_url]        
    js_options['ajaxOptions'] = options[:options] if options[:options]
    js_options['evalScripts'] = options[:script] if options[:script]
    js_options['callback']   = "function(form) { return #{options[:with]} }" if options[:with]
    js_options['clickToEditText'] = %('#{options[:click_to_edit_text]}') if options[:click_to_edit_text]
    function << (', ' + options_for_javascript(js_options)) unless js_options.empty?
    
    function << ')'
    
    javascript_tag(function)
  end
  
  def in_place_edit_for(object, attribute, options = {})
    define_method("set_#{object}_#{attribute}") do
      @item = object.to_s.camelize.constantize.find(params[:id])
      @item.update_attribute(attribute, params[:value])
      
#      map = {
#              'true' => "YES",
#              'false' => "NO",
#      }
      unless options[:text].blank?
        display = nil
        options[:text].split(".").each{|t|
          display = (display || @item).send(t)
        }
      end
      render :text => map[@item.send(attribute).to_s] || display ||  @item.send(attribute)
      
    end
  end
  
end



