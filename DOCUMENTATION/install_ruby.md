# installation de RUBY
> requis pour certaines application, ruby est déjà installé sous OSX

- dans le répertoire courant ~/
1. RBENV
```shell
    git clone https://github.com/rbenv/rbenv.git ~/.rbenv
    echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
    echo 'eval "$(rbenv init -)"' >> ~/.bashrc
    exec $SHELL
```

2. Ruby-build 
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
exec $SHELL


3. installation local à un dossier ou global à l'env

```shell
rbenv install 2.3.1
rbenv global 2.3.1
ruby -v
```

```shell
find -name 'ruby';
```
> donc ruby est installé via RBENV v2.3.1
(./.oh-my-zsh/plugins/ruby)
./.rbenv/shims/ruby
./.rbenv/versions/2.3.1/include/ruby-2.3.0/x86_64-linux/ruby
./.rbenv/versions/2.3.1/include/ruby-2.3.0/ruby
./.rbenv/versions/2.3.1/share/doc/ruby
./.rbenv/versions/2.3.1/bin/ruby
./.rbenv/versions/2.3.1/lib/ruby


```shell
ruby -v
```
> ruby 2.3.1p112 (2016-04-26 revision 54768) [x86_64-linux]
./.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/net-telnet-0.1.1/Gemfile
./.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/bundler-1.12.5/lib/bundler/templates/Gemfile
./.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/power_assert-0.2.6/Gemfile
./.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/did_you_mean-1.0.0/Gemfile

# INstallation de BUNDLER

```shell
gem install bundler
bundle -v
```
> a ne faire qu'une fois le hashage

```shell
rbenv rehash
```
