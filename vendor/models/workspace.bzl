load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_file")

def models_workspace():
    http_file(
        name = "models_resnext50",
        urls = ["https://github.com/plaidml/depot/raw/master/datasets/resnext50_tf_saved_model.tar.gz"],
        sha256 = "4d980e8d074697df76341a8c624a8a13437d388b809d5872c3565fcb55305f89",
    )

    http_file(
        name = "models_resnet50",
        urls = ["http://download.tensorflow.org/models/official/20180601_resnet_v2_imagenet_savedmodel.tar.gz"],
        sha256 = "12750a1932612e5b45fc6ee51f06b8f42f2a3263683574a24e68c9d5fab23b48",
    )
