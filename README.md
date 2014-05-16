This is an OpenShift DIY cartridge that sets up news.arc on a diy app.

Follow these instructions to install it, based on RayRacine's code at github.com/RayRacine/rackos

1. Create an account on OpenShift.
1. Use their console to create an application, say named "test".
  * The console shows you that you have a git repo, and a URL for your app.
  * e.g., git clone ssh://\<long number here>@test-\<namespace>.rhcloud.com/~/git/test.git/ 
  * and http://test-\<namespace>.rhcloud.com
1. Clone your OpenShift repo on your laptop or whatever in say /code
  * cd /code
  * git clone ssh://\<long number here>@test-\<namespace>.rhcloud.com/~/git/test.git/
  * cd /code/test
  * Now in your locally cloned repo.
1. Add my repository with the scripts.
  * git remote add arc-openshift git://github.com/shader/arc-openshift.git
1. Fetch it down and merge it.
  * git fetch arc-openshift
  * git merge --ff arc-openshift/master
1. There is a hidden directory .openshift/action_hooks.
  * If you read the OpenShift docs or the README for this project you'll see that basically that these hooks scripts are what drives OpenShift's DIY cartridge.
  * A key script is the pre_build which is called when a push to your remote OpenShift repo occurs.  
  * pre_build checks to see if local copies of Racket and anarki are installed.  If not they will be download and installed in the data directory. The post-deploy hook then starts the news.arc server.
1. That's it.  Test it by hitting it in your browser. Here is mine http://test-shader.rhcloud.com
1. Further reading of the OpenShift doc explains how to use your personal domain in lieu of the rhcloud.com domain.

## Next Steps.

Edit your code locally.  Test run it locally or don't.  When ready, commit and push it OpenShift and the scripts will automatically stop/start the server with the new changes.