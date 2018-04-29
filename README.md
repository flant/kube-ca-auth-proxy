# kube-prometheus-auth-proxy

Example:
```
spec:
  template:
    spec:
      containers:
      - name: prometheus-auth-proxy
        image: flant/kube-prometheus-auth-proxy:v0.0.1
        args:
        - "--listen=9000"
        - "--proxy-pass=http://localhost:9001/"
```

If you run your pod in hostNetwork, better listen on podIP:
```
spec:
  template:
    spec:
      containers:
      - name: prometheus-auth-proxy
        image: flant/kube-prometheus-auth-proxy:v0.0.1
        args:
        - "--listen=$(MY_POD_IP):9000"
        - "--proxy-pass=http://localhost:9001/"
        env:
        - name: MY_POD_IP
          valueFrom:
            fieldRef:
              fieldPath: status.podIP

```
