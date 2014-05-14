; Load news.arc on 8080 (OPENSHIFT_DIY_PORT)
(= getenv [$.getenv string._])
(= root getenv!OPENSHIFT_REPO_DIR)
(def cd ((o path nil))
  (if path
      ($.current-directory path)
      ($ (path->string (current-directory)))))

(cd root)

(nsv (list getenv!OPENSHIFT_DIY_IP 8080))