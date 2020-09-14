module ApplicationHelper
  def full_title(page_title)
    base_title = "A Touch Of Tranquility"
    page_title.present? ? "#{page_title} | #{base_title}" : base_title
  end

  def bootstrap_class_for(flash_type)
    flashes = { :success => "message__alert-success", :error => "message__alert-danger", :alert => "message__alert-block", :notice => "message__alert-info" }
    flashes[flash_type.to_sym] || flash_type.to_s
  end
end
