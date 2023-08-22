class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.string :body
      t.references :chat
      t.timestamps
    end
  end
end
