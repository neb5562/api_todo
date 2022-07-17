class CreateDenyTokens < ActiveRecord::Migration[7.0]
  def change
    create_table :deny_tokens do |t|
      t.string :token, null: false, index: { unique: true }
      t.datetime :expire, null: true

      t.timestamps
    end
  end
end
