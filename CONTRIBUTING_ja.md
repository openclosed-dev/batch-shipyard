# 開発者向けガイド

## 開発環境

推奨する開発環境を以下に示す。

* Ubuntu 24.04 LTS
* Python 3.12.3 or higher
* Docker Engine 27.3.1 or higher

開発環境の具体的な構築方法を以降の節で説明する。

### Pythonのセットアップ

Pythonの`venv`モジュールを使用するため、次のコマンドを実行して必要なパッケージをインストールしておく。

```shell
sudo apt install python3-venv
```

ローカルリポジトリのルートに移動して、このプロジェクト用にPythonの仮想環境を作成する。仮想環境名は `.venv` とする。

```shell
python3 -m venv .venv
```

作成した仮想環境は、次のコマンドでアクティブにできる。
```shell
source .venv/bin/activate
```

仮想環境がアクティブな状態で、python と pip のバージョンを確認する。
```shell
python -V
# pythonのバージョンが表示される
pip -V
# pipのバージョンとパスが表示される
```

必要なパッケージを仮想環境に対してインストールする。
```shell
pip install -r requirements.txt
# CLIツールのビルドに必要なため追加する
pip install pyinstaller
```

### Docker Engineのセットアップ

[Install Docker Engine on Ubuntu](https://docs.docker.com/engine/install/ubuntu/)の指示にしたがって、Docker Engineをインストールする。

インストール完了後に、`hello-world` イメージを起動して動作を確認する。
```shell
sudo docker run hello-world
```

セットアップが正しく完了している場合は、以下と同様なメッセージが出力される。
```shell
Hello from Docker!
This message shows that your installation appears to be working correctly.
# 以下省略
```

`sudo`を指定せずに `docker` コマンドを実行したい場合は、カレントユーザを `docker`グループに追加する。
```shell
sudo usermod -aG docker $USER
newgrp docker
```

設定した結果が有効であることを確認する。もしうまくいかない場合は一度ログアウトして再度実行してみる。
```
docker run hello-world
```

## ビルド方法
### CLIツールのビルド

Linux向けのCLIツールをビルドする場合は、次のコマンドを実行する。
Pythonの仮想環境がアクティブであることを確認すること。
```shell
./build-cli.sh
```

ビルドが成功すると、中間ファイルが `build` ディレクトリに、実行ファイルが `dist` ディレクトリに出力される。
実行ファイルを起動すると Usage がコンソールに表示される。
```shell
dist/batch-shipyard-<version>-cli-linux-x86_64
```

### Dockerイメージのビルド

Azure Batchの開始タスクで使用されるため、少なくとも以下の2つのDockerイメージをビルドする必要がある。

1. shipyard-cargo
2. shipyard-cascade

次のコマンドを実行して shipyard-cargo イメージをビルドする。
```shell
cd cargo
docker image build <レジストリ名>/shipyard-cargo:<バージョン>
cd ..
```

同様に次のコマンドを実行して shipyard-cascade イメージをビルドする。
```shell
cd cascade
docker image build -f Dockerfile.docker -t openclosed/shipyard-cascade:4.0.0-rc.2 .
cd ..
```

ビルドした2つのイメージがローカルに追加されたことを確認する。
```
docker image ls
```

## リリース方法

### バージョン番号の更新

バージョン番号は以下のファイルに記載されている。リリース時に変更すること。

**ファイルパス**: convoy/version.py
```python
__version__ = '4.0.0-rc.2'
```
