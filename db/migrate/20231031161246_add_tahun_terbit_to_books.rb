class AddTahunTerbitToBooks < ActiveRecord::Migration[7.1]
  def change
    add_column :books, :tahun_terbit, :integer

    # Book.update_all(tahun_terbit: 2022)
  end
end
