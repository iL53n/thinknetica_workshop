require 'rails_helper'

RSpec.describe Book, type: :model do
  it { should validate_presence_of :title }
  # it { should validate_presence_of :body }
  it { should validate_presence_of :author }
  it { should validate_uniqueness_of :title }

  describe 'Scopes' do
    context '#week' do
      let(:last_books) { create_list(:book, 3) }
      let(:old_books)  { create_list(:book, 7, created_at: Time.now - (8 * 86_400)) }

      it 'returns books of the last week' do
        expect(Book.week).to match_array(last_books)
      end
    end
  end

  describe 'Methods' do
    context '#set_empty_body' do
      let(:book) { build(:book, :nil_body) }

      it 'nil body before save' do
        expect(book.body).to eq(nil)
      end

      it 'set empty body message after save' do
        book.save
        expect(book.body).to eq('No description')
      end
    end
  end
end
