module ApplicationHelper
  def full_title(page_title)
    base_title = "A Touch Of Tranquility"
    page_title.present? ? "#{page_title} | #{base_title}" : base_title
  end

  def bootstrap_class_for(flash_type)
    flashes = { :success => "alert-success", :error => "alert-danger", :alert => "alert-block", :notice => "alert-info" }
    flashes[flash_type.to_sym] || flash_type.to_s
  end
end
