An OpenShift DIY cartridge that sets up news.arc on a diy app.

Quickstart
-
1. Create an account on [OpenShift](https://www.openshift.com/app/account/new) and install [the OpenShift Client Tools](https://developers.openshift.com/en/managing-client-tools.html).

2.  ` rhc app-create arc diy-0.1 --from-code https://github.com/shader/arc-openshift `

Usage
-

1. Create an account and Add your account to admins.

 ```
 rhc ssh arc
 echo $your-username > app-root/repo/www/admins
 ```

2.  Customize

 ```
 vi app-root/data/arc/lib/news.arc
 ```

 Or allow users open news in new tap. Just add one line:
 ```
  (mac npage (title . body)
    `(tag html
       (tag head
         (gen-css-url)
         (prn "<link rel=\"shortcut icon\" href=\"" favicon-url* "\">")
         (prn "<meta name=\"viewport\" content=\"width=device-width\">")
         (prn "<base target=\"_blank\">")  ;;                                       <--- add this line
         (tag script (pr votejs*))
         (tag title (pr ,title)))
       (tag body
         (center
           (tag (table border 0 cellpadding 0 cellspacing 0 width "85%"
                       bgcolor sand)
             ,@body)))))
 ```

3. Restart the server.
 
 ```
 rhc app-force-stop arc && rhc app-start arc
 ```

Bugs
-
Please Submit [issues](https://github.com/shader/arc-openshift/issues/new).

Thanks to
-
[RayRacine](http://github.com/RayRacine/rackos)






