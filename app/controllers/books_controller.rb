class BooksController < ApplicationController

    # 保存機能
  def create
    # １.&2. データを受け取り新規登録するためのインスタンス作成
    @book = Book.new(book_params)
    # 3. データをデータベースに保存するためのsaveメソッド実行
      if @book.save
       # 4. トップ画面へリダイレクト
        flash[:notice] = "Book was successfully created."
        redirect_to book_path(@book.id)

      else
        # renderでコントローラを経由せずshow.html.erbに行くため@booksを定義
        @books = Book.all
        render :index
      end
  end

  # 一覧機能
  def index
    # @book = Book.find(params[:id])
    @book = Book.new
    @books = Book.all
  end

  # 詳細機能
  def show
    @book = Book.find(params[:id])

  end

  # 編集機能
  def edit
    @book = Book.find(params[:id])
  end

  # 更新機能
  def update
    # 取得
    @book = Book.find(params[:id])
    if @book.update(book_params)

      flash[:notice] = "Book was successfully updated."
      redirect_to book_path(@book.id)

    else
      @books = Book.all
      render :edit
    end

  end

  # 削除機能
  def destroy

    book = Book.find(params[:id])  # データ（レコード）を1件取得
    book.destroy  # データ（レコード）を削除

    flash[:notice] = "Book was successfully destroyed."#メッセージ表示
    redirect_to books_path# 投稿一覧画面へリダイレクト

  end

  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
