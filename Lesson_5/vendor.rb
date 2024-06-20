# frozen_string_literal: true

module Vendor
  attr_reader :vendor_label

  def set_vendor_label(vendor_label)
    self.vendor_label=vendor_label
  end

  protected

  attr_writer :vendor_label
end
