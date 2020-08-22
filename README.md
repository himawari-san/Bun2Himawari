# 分類語彙表　→　『ひまわり』変換ツール
　分類語彙表のテキストデータを全文検索システム『ひまわり』用のXMLファイルへ変換します。

## 変換方法

``` shell
 $ perl bun2himawari.pl < bunruidb.txt > corpus.xml
```

- bunruidb.txtは，[分類語彙表のテキストデータ](https://pj.ninjal.ac.jp/corpus_center/goihyo.html)から入手してください。
- corpus.xmlが変換結果です。

## 『ひまわり』へのインストール方法
1. Package/Corpora/Bunrui/ に corpus.xml をコピーしてください。
2. 『ひまわり』を起動し，Package フォルダを『ひまわり』にドラッグ＆ドロップしてください。
3. [ツール]→[構築]→[インデックス生成]を実行してください。
4. 以上で終了です。使い方は，『ひまわり』の[『分類語彙表』パッケージ](https://www2.ninjal.ac.jp/lrc/index.php?%C1%B4%CA%B8%B8%A1%BA%F7%A5%B7%A5%B9%A5%C6%A5%E0%A1%D8%A4%D2%A4%DE%A4%EF%A4%EA%A1%D9/%A5%C0%A5%A6%A5%F3%A5%ED%A1%BC%A5%C9/%A1%D8%CA%AC%CE%E0%B8%EC%D7%C3%C9%BD%A1%D9%A5%D1%A5%C3%A5%B1%A1%BC%A5%B8)を参照してください。
