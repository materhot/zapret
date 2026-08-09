FROM alpine:latest
# Thêm libcap-dev vào danh sách các gói cần cài đặt
RUN apk add --no-cache git make gcc musl-dev linux-headers iptables bsd-compat-headers libcap-dev
RUN git clone --depth=1 https://github.com/bol-van/zapret.git /zapret
WORKDIR /zapret
RUN make -C tpws
CMD ["/zapret/tpws/tpws", "--user=nobody", "--port=1080", "--bind-addr=0.0.0.0"]
