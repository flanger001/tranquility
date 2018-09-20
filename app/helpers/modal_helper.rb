module ModalHelper
  def modal(name, id, partial, _options = {})
    content_tag(:div, class: %w(modal fade), id: id, tabindex: '-1', role: 'dialog', 'aria-labelledby' => id, 'aria-hidden' => true) do
      content_tag(:div, class: 'modal-dialog') do
        content_tag(:div, class: 'modal-content') do
          content_tag(:div, class: 'modal-header') do
            content_tag(:button, '&times;'.html_safe, class: 'close', data: { dismiss: 'modal' }) +
              content_tag(:h3, name, class: 'modal-title')
          end +
            content_tag(:div, render(partial), class: 'modal-body') +
            content_tag(:div, class: 'modal-footer') do
              content_tag(:button, 'Close', class: ['btn', 'btn-default'], data: { dismiss: 'modal' })
            end
        end
      end
    end
  end
end
