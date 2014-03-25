class CreateLinkedins < ActiveRecord::Migration
  def change
    create_table :linkedins do |t|
      t.belongs_to :user, index: true
      t.belongs_to :contact, index: true

      t.timestamps
    end
  end
end
