GUI アプリを入れたりダブルクリックで反転選択してコピーとかをしたくないので作った

## 特徴
+ メモを絞り込んで選択出来る
+ 絞り込んだ内容はコピーか実行ができる
+ 複数のノートを用意して環境ごとに違うメモを書く事が出来る
  + 例）会社のマシン専用ノートと、家と会社共用のノート
+ ラベル、もしくは内容で絞り込みが出来る
+ パスワードは非表示に出来る
+ 編集が楽なのでメモ内容はデータベースではなくファイルに残す
  + ファイルの中のパスワードはマスクされていない
  + それが覗かれるならもう色々終わってるという判断

## 事後処理
+ ブラウザで開く
+ クリップボードに入れる

## 未対応点
以下は自分専用なので用意しなかった機能

+ コマンドの実行履歴をメモに追記出来る
+ メモの内容を選択して編集・削除することが出来る
+ ノートのパスは固定値
+ json の文法エラーや空ファイル等のガード
+ percol による複数選択
+ 選択した行を iTerm に送る