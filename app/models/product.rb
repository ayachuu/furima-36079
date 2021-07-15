class Product < ApplicationRecord
  t.name :string,                     null: false
  t.description :text,                null: false
  t.category_id :integer,             null: false
  t.condition_id :integer,            null: false
  t.destination_id :integer,          null: false
  t.prefecture_id :integer,           null: false
  t.delivery_date_id :integer,        null: false
  t.price :integer,                   null: false
  t.user :references,                 null: false, foreign_key:true
  t.timestamps

end
