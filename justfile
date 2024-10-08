_default:
    just --list

# build
@build:
    cargo clean
    cargo build --release
    fd -e so . 'target/release/'

# test
@test:
    luajit test.lua

# install
@install:
    sudo cp target/release/librume.so /usr/local/lib/lua/5.1/rume.so
    sudo cp target/release/librume.so /usr/local/share/lua/5.1/
    sudo cp target/release/librume.so /usr/share/luajit-2.1/
    echo 'Installed rume.so'
