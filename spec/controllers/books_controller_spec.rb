require 'rails_helper'

RSpec.describe Api::V1::BooksController, type: :controller do
  describe 'GET #index' do
    let(:books) { create_list(:book, 7) }

    before { get :index }

    it { expect(response).to have_http_status 200 }
    it { expect(response.content_type).to eq "application/json; charset=utf-8" }
    it 'populates an array of all books' do
      expect(assigns(:books)).to match_array(@books)
    end
  end

  describe 'GET #show' do
    let(:book) { create(:book) }

    before { get :show, params: { id: book.id } }

    it { expect(response).to have_http_status 200 }
    it { expect(response.content_type).to eq "application/json; charset=utf-8" }
    it 'assigns the requested book to @book' do
      expect(assigns(:book)).to eq(book)
    end
  end
end
