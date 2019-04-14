
# ssh -NfL *:50022:10.134.224.192:22 bigdata@10.57.232.169 -o "ProxyCommand=nc -X connect -x 192.168.1.18:808 %h %p"
