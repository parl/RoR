# spec/models/book_spec.rb
require 'rails_helper'

RSpec.describe Book, type: :model do
  it "is valid with valid attributes" do
    book = Book.new(title: "Sample Book", tahun_terbit: 2022)
    expect(book).to be_valid
  end

  it "is not valid without a title" do
    book = Book.new(title: nil, tahun_terbit: 2022)
    expect(book).to_not be_valid
  end

  it "is not valid without a tahun_terbit" do
    book = Book.new(title: "Sample Book", tahun_terbit: nil)
    expect(book).to_not be_valid
  end

  it "belongs to an author" do
    association = described_class.reflect_on_association(:author)
    expect(association.macro).to eq :belongs_to
  end

  it "responds to a custom method" do
    book = Book.new(title: "Sample Book", tahun_terbit: 2022)
    expect(book).to respond_to(:custom_method)
  end

  it "performs a custom method correctly" do
    book = Book.new(title: "Sample Book", tahun_terbit: 2022)
    expect(book.custom_method).to eq "Sample Book (2022)"
  end
end
