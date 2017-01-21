��          ,      <       P   O  Q   @  �  �  �                     create portable object template for current project.

## Synopsis

```
    mix l10n.xgettext [--app src_root]...
```

## Arguments

  * --app srcroot  -- addional `app` and src_root
                      for correcting @moduledoc, @doc

## Environment

  * LANG -- localize target language for `Language`

## Mix Environment

  * project[:app] -- basename for portable object file.

## Files

### Input

  * `app`.pot_db -- message database generated by gettext macro.

### Output

  * priv/po/`app`.pot -- portable object template generated by
                         l10n.xgettext task.

 Project-Id-Version: 
PO-Revision-Date: 2017-01-21 22:19+0900
Last-Translator: DSpaceユーザ <EMAIL@ADDRESS>
Language-Team: Japanese
Language: ja
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Plural-Forms: nplurals=1; plural=0;
POT-Creation-Date: 
X-Generator: Poedit 1.8.11
 カレントプロジェクトのPOT（portable object template）を作成します。

## 概要

```
    mix l10n.xgettext [--app src_root]...
```

## 引数

  * --app srcroot  -- @moduledoc, @docを収拾する 追加の `app` と src_root

## 環境

  * LANG -- localize target language for `Language`

## Mix環境

  * project[:app] -- PO（portable object）ファイルのベース名。

## ファイル

### 入力

  * `app`.pot_db -- gettext マクロにより作成されたメッセージデータベース

### 出力

  * priv/po/`app`.pot -- l10n.xgettextタスクにより生成される
       POT（portable object template）

 