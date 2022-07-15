class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username, null: false, unique: true, length: { minimum: 3, maximum: 50 }
      t.string :password_digest, null: false, length: { minimum: 3 }

      t.timestamps
    end
  end
end
