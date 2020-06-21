# 重新创建 token
[root@k8s-master ~]# kubeadm token create
wxvdun.vec7m9cu4ru3hngg

[root@k8s-master ~]# kubeadm token list
TOKEN                     TTL       EXPIRES                     USAGES                   DESCRIPTION   EXTRA GROUPS
wxvdun.vec7m9cu4ru3hngg   23h       2019-10-18T10:43:34+08:00   authentication,signing   <none>        system:bootstrappers:kubeadm:default-node-token

# 生成sha256值
[root@k8s-master ~]# openssl x509 -pubkey -in /etc/kubernetes/pki/ca.crt | openssl rsa -pubin -outform der 2>/dev/null | openssl dgst -sha256 -hex | sed 's/^.* //'
[root@k8s-master ~]# ls
ed7ea5ae0c06f4ace9013e663b223e8da72e4e94e4dc657cfb1db68d777f3984

# join加入
[root@k8s-node01 ~]# kubeadm join 192.168.1.200:6443 --token wxvdun.vec7m9cu4ru3hngg     --discovery-token-ca-cert-hash sha256:ed7ea5ae0c06f4ace9013e663b223e8da72e4e94e4dc657cfb1db68d777f3984 
