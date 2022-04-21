docker run -it -d --privileged \
           -v /Users/mafeichao/Work/tf_dev:/work \
           -p 8822:22 \
           mafeichao/centos7:tf_v1 \
           /usr/sbin/init


export TEST_TMPDIR=/work/bazel/
bazel build --config=opt //tensorflow/tools/pip_package:build_pip_package

