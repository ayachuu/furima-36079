class PurchaseRecordsController < ApplicationController
  def index
    @purchase_record = PurchaseRecord.all
  end

  def create
    binding.pry
  end
end
