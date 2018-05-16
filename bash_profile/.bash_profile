# Change terminal prompt:
export PS1="🍇  "

# Node
export PATH=$PATH:~/toolbox/node/bin
export NODE_ENV='dev'

# Solr
export PATH=$PATH:~/toolbox/solr/bin

# Spark
export SPARK_HOME=~/toolbox/spark
export PATH=$PATH:$SPARK_HOME/bin

#PySpark
export PYSPARK_PYTHON=~/toolbox/python/vp3/bin/python3
export PYTHONPATH=$SPARK_HOME/python/:$PYTHONPATH

###################
##   Shortcuts   ##
###################

# Python
alias vp3='source ~/toolbox/python/vp3/bin/activate'
# alias ocv='source ~/toolbox/python/openCV/bin/activate'

# Notebook
alias nb='~/projects/bash_things/launch_jupyter.sh'

# Server
alias serve='sh ~/projects/webapps/nodejs_express_boilerplate_websocket/run.sh'

# Torrent client
alias torrent='deluge-web'
