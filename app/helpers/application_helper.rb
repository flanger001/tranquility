module ApplicationHelper
  def full_title(page_title)
    base_title = "A Touch Of Tranquility"
    page_title.present? ? "#{page_title} | #{base_title}" : base_title
  end

  def add_extra_fields_link(name, form, association)
    new_object = form.object.send(association).klass.new
    id = new_object.object_id
    fields = form.fields_for(association, new_object, child_index: id) do |f|
      render association.to_s.singularize + "_fields", form: f
    end
    link_to name, "#", class: "btn btn-default add_fields", data: { id: id, fields: fields.delete("\n") }
  end

  def bootstrap_class_for(flash_type)
    flashes = { success: "alert-success", error: "alert-danger", alert: "alert-block", notice: "alert-info" }
    flashes[flash_type.to_sym] || flash_type.to_s
  end
end
