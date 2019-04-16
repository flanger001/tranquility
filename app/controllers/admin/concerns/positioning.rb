module Admin
  module Concerns
    module Positioning
      def move_up
        resource.move_higher
        redirect_to [:admin, resource_class], :notice => "#{capital_resource_class} moved up."
      end

      def move_down
        resource.move_lower
        redirect_to [:admin, resource_class], :notice => "#{capital_resource_class} moved down."
      end

      def move_to_top
        resource.move_to_top
        redirect_to [:admin, resource_class], :notice => "#{capital_resource_class} moved to top."
      end

      def move_to_bottom
        resource.move_to_bottom
        redirect_to [:admin, resource_class], :notice => "#{capital_resource_class} moved to bottom."
      end
    end
  end
end
