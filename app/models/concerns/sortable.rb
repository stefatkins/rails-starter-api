module Sortable
  extend ActiveSupport::Concern

  module ClassMethods
    def apply_sorts(sort, options = { allowed: [], default: [] })
      allowed = options[:allowed].map(&:to_s)
      fields = sort.to_s.split(',')

      ordered_fields = convert_to_ordered_hash(fields)
      filtered_fields = ordered_fields.select { |key, _| allowed.include?(key) }
      order = filtered_fields.presence || options[:default]
      self.order(order)
    end

    def convert_to_ordered_hash(fields)
      fields.each_with_object({}) do |field, hash|
        if field.start_with?('-')
          field = field[1..-1]
          hash[field] = :desc
        else
          hash[field] = :asc
        end
      end
    end
  end
end
