# frozen_string_literal: true

module OrdersHelper
  def check_status_form(status)
    status = if status.pedding?
              %w[in_progres in_progres]
            elsif status.in_progres?
              %w[concluead concluead]
    end
    status
  end
end
