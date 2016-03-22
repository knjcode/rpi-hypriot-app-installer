FROM hypriot/rpi-golang

# Create app dir
RUN mkdir /app

# Make direnv
RUN go get github.com/direnv/direnv \
  && cd $GOPATH/src/github.com/direnv/direnv \
  && git checkout v2.7.0 \
  && make \
  && mv direnv /app

# Make fugu
RUN go get github.com/tools/godep \
  && git clone --depth 1 https://github.com/mattes/fugu $GOPATH/src/github.com/mattes/fugu \
  && cd $GOPATH/src/github.com/mattes/fugu/fugu \
  && GOOS=linux GOARCH=arm godep go build -o /app/fugu

# Make ghq
RUN go get github.com/motemen/ghq \
  && cd $GOPATH/src/github.com/motemen/ghq \
  && make build \
  && mv ghq /app

# Make peco
RUN go get github.com/peco/peco \
  && cd $GOPATH/src/github.com/peco/peco \
  && go build cmd/peco/peco.go \
  && mv peco /app

ADD installer /installer

RUN chmod +x /installer

CMD /installer
