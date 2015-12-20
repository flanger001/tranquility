module DsActsAsList
  def self.included(base)
    base.class_eval do
      def move_down
        move_lower
      end

      def move_up
        move_higher
      end
    end
  end
end
