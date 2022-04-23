docker run -it -d --privileged \
           -v /Users/mafeichao/Work/tf_dev:/work \
           -p 8822:22 \
           mafeichao/centos7:tf_v1 \
           /usr/sbin/init


export TEST_TMPDIR=/Users/mafeichao/Work/tf_dev/bazel
bazel build --config=opt //tensorflow/tools/pip_package:build_pip_package

nohup rsync -avzP 43.152.204.44::tf_dev . &
