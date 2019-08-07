# kube-ca-auth-proxy

Example:
```
spec:
  template:
    spec:
      containers:
      - name: ca-auth-proxy
        image: flant/kube-ca-auth-proxy:v0.1.0
        args:
        - "--listen=9000"
        - "--proxy-pass=http://localhost:9001/metrics"
```

If you run your pod in hostNetwork, better listen on podIP:
```
spec:
  template:
    spec:
      containers:
      - name: ca-auth-proxy
        image: flant/kube-ca-auth-proxy:v0.1.0
        args:
        - "--listen=$(MY_POD_IP):9000"
        - "--proxy-pass=http://localhost:9001/metrics"
        env:
        - name: MY_POD_IP
          valueFrom:
            fieldRef:
              fieldPath: status.podIP

```
