class TranquilityForm < ActionView::Helpers::FormBuilder
  def active_check_box
    @template.tag.div(class: "form-group") do
      @template.label(@object_name, :active, class: "checkbox") do
        @template.check_box(@object_name, :active, { checked: @object.active }) + "Show this #{@object_name.humanize.downcase}?"
      end
    end
  end

  def add_additional(association, label = nil, partial: nil)
    partial ||= "admin/#{@object_name.pluralize}/#{association.to_s.singularize}_fields"
    label ||= association
    new_object = @object.send(association).klass.new
    id = new_object.object_id
    fields = fields_for(association, new_object, child_index: id) do |f|
      ApplicationController.render(partial: partial, locals: { form: f })
    end
    ApplicationController.helpers.link_to(label, "#", class: "btn btn-default add_fields", data: { id: id, fields: fields.delete("\n") })
  end
end
