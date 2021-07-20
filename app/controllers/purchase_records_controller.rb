class PurchaseRecordsController < ApplicationController
  def index
    @purchase_record_retailer = PurchaseRecordRetailer.all
  end
end
