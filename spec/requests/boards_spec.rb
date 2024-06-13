require "rails_helper"

describe "Boards" do
  describe "GET /boards" do
    before do
      Board.create!(name: "Some Board")
      Board.create!(name: "Another Board")
      get "/boards"
    end

    it "returns a list of boards" do
      expect(response.body).to include("Some Board", "Another Board")
    end

    it "returns success" do
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /boards" do
    before do
      post "/boards", params: {board: {name: "Test Board"}}
    end

    it "creates a board" do
      expect(Board.last).to have_attributes({name: "Test Board"})
    end

    it "redirects to the board" do
      expect(response).to redirect_to(Board.last)
    end

    it "sets a success flash message" do
      expect(flash[:notice]).to eq "Board was successfully created."
    end
  end

  describe "GET /board/{id}" do
    let(:board) { Board.create!(name: "Test Board") }

    before do
      get "/boards/#{board.id}"
    end

    it "incldues the name of the board" do
      expect(response.body).to include("Test Board")
    end

    it "returns success" do
      expect(response).to have_http_status(:success)
    end
  end

  describe "PUT /board/{id}" do
    let(:board) { Board.create!(name: "Test Board") }

    context "when the form is valid" do
      before do
        put "/boards/#{board.id}", params: {board: {name: "Some New Name"}}
      end

      it "updates the name of the board" do
        expect(board.reload.name).to eq("Some New Name")
      end

      it "redirects to the board" do
        expect(response).to redirect_to(board)
      end

      it "sets a success flash message" do
        expect(flash[:notice]).to eq "Board was successfully updated."
      end
    end

    context "when the form is not valid" do
      before do
        put "/boards/#{board.id}", params: {board: {name: ""}}
      end

      it "returns unprocessable_content http status code" do
        expect(response).to have_http_status(:unprocessable_content)
      end

      it "renders the edit page" do
        expect(response.body).to include("Edit Board")
      end

      it "sets a failure flash message" do
        expect(flash.now[:alert]).to eq "Failed to update board."
      end
    end
  end

  describe "DELETE /board/{id}" do
    let(:board) { Board.create!(name: "Test Board") }

    before do
      delete "/boards/#{board.id}"
    end

    it "deletes the board" do
      expect(Board.exists?(id: board.id)).to be false
    end

    it "redirects to the boards index page" do
      expect(response).to redirect_to(Board)
    end

    it "sets a success flash message" do
      expect(flash[:notice]).to eq "Board was successfully deleted."
    end
  end
end
