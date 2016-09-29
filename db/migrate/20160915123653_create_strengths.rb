class CreateStrengths < ActiveRecord::Migration
  def change
    create_table :strengths, id: :uuid, default: "uuid_generate_v4()" do |t|
      t.decimal :strength
      t.uuid :router_id, index: true

      t.timestamps null: false
    end
  end
end
