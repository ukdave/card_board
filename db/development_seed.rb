Board.destroy_by(name: "Test Board")
board = Board.create!(name: "Test Board")

column_todo = Column.create!(board:, name: "Todo")
column_doing = Column.create!(board:, name: "Doing")
column_done = Column.create!(board:, name: "Done")

Card.create!(column: column_todo, title: "Thing to do")
Card.create!(column: column_todo, title: "Another thing to do")

Card.create!(column: column_doing, title: "Doing a thing")
Card.create!(column: column_doing, title: "Doing another thing")

Card.create!(column: column_done, title: "Did a thing")
Card.create!(column: column_done, title: "Did another thing")
