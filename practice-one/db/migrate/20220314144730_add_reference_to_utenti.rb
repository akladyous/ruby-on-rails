class AddReferenceToUtenti < ActiveRecord::Migration[7.0]
  def change
    add_reference :utentis, :manager, index: true, foreign_key: {to_table: "utentis"}
  end
end
