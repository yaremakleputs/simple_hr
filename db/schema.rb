ActiveRecord::Schema.define(version: 20_180_326_220_612) do
  create_table 'users', force: :cascade do |t|
    t.string   'email',           null: false
    t.string   'password_digest', null: false
    t.string   'first_name'
    t.string   'last_name'
    t.string   'type'
    t.datetime 'created_at',      null: false
    t.datetime 'updated_at',      null: false
  end
end
