; Load news.arc on 8080 (OPENSHIFT_DIY_PORT)
(= getenv [$.getenv string._])
(= root getenv!OPENSHIFT_REPO_DIR)
(= tmpdir* (+ getenv!OPENSHIFT_DATA_DIR "tmp")) ;put temporary data in the app data directory
(ensure-dir tmpdir*)

(def cd ((o path nil))
  (if path
      ($.current-directory path)
      ($ (path->string (current-directory)))))

(cd root)

(nsv (list getenv!OPENSHIFT_DIY_IP 8080))