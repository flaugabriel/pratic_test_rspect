class Order < ApplicationRecord
  enum status: %i[pedding in_progres concluead]

  validates_presence_of :description, on: :create, message: "can't be blank"
  validates_presence_of :control_number, on: :create, message: "can't be blank"
  validates_presence_of :status, on: :create, message: "can't be blank"

  validate :status_validate, on: :update

  def status_validate
    current_status = Order.consult_status(id)
    return if current_status.status == 'concluead' || status != 'pedding' 

    errors.add(:base, 'Not permit current status is ' + current_status.status)
  end

  def self.consult_status(id)
    find(id)
  end
end
