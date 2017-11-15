Sequel.migration do
  change do
    create_table(:entries) do
      primary_key :id
      DateTime :created_at, default: Sequel::CURRENT_TIMESTAMP, index: true
      String :text, null: false
      constraint(:text_min_length) { Sequel.char_length(text) > 0 }
    end
  end
end
