FROM alpine:latest
RUN apk add --no-cache git make gcc musl-dev linux-headers iptables bsd-compat-headers libcap-dev zlib-dev libnetfilter_queue-dev
RUN git clone --depth=1 https://github.com/bol-van/zapret.git /zapret
WORKDIR /zapret
RUN make -C nfqws
CMD ["/zapret/nfqws/nfqws", "--user=nobody", "--qnum=200", "--hostlist=/zapret/autohostlist.txt", "--desync=split2"]
