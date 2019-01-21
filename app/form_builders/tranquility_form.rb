class TranquilityForm < ActionView::Helpers::FormBuilder
  def active_check_box
    @template.tag.div(class: "form-group") do
      @template.label(@object_name, :active, class: "checkbox") do
        @template.check_box(@object_name, :active, { checked: @object.active }) + "Show this #{@object_name.humanize.downcase}?"
      end
    end
  end
end
