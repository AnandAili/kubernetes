By Default, kubernetes edit will open the manifest file in the default editor of the OS. we can change it by using the below
command
In my case, I am setting nano as a editor for editing kubenetes manifest files
# export KUBE_EDITOR="/usr/bin/nano"
