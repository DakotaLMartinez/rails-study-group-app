class CreateInquiries < ActiveRecord::Migration[5.2]
  def change
    create_table :inquiries do |t|
      t.string :email_address
      t.string :phone_number
      t.string :name
      t.text :content

      t.timestamps
    end
  end
end
