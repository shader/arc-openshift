; Load news.arc on 8080 (OPENSHIFT_DIY_PORT)
(= getenv [$.getenv string._])

(nsv (list getenv!OPENSHIFT_DIY_IP 8080))