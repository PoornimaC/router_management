class CreateRouters < ActiveRecord::Migration
  def change
    create_table :routers, id: :uuid, default: "uuid_generate_v4()" do |t|
      t.string :name
      t.string :location

      t.timestamps null: false
    end
  end
end
