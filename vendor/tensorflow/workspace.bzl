load("//vendor/bazel:repo.bzl", "http_archive")

# Sanitize a dependency so that it works correctly from code that includes it as a submodule.
def clean_dep(dep):
    return str(Label(dep))

def plaidml_tf_workspace():
    http_archive(
        name = "io_bazel_rules_closure",
        sha256 = "5b00383d08dd71f28503736db0500b6fb4dda47489ff5fc6bed42557c07c6ba9",
        strip_prefix = "rules_closure-308b05b2419edb5c8ee0471b67a40403df940149",
        url = "https://github.com/bazelbuild/rules_closure/archive/308b05b2419edb5c8ee0471b67a40403df940149.tar.gz",  # 2019-06-13
    )

    http_archive(
        name = "org_tensorflow",
        url = "https://github.com/tensorflow/tensorflow/archive/ca0607c19884fc8eb0a4d32a1fe58cc42ced8737.zip",
        sha256 = "eb70004992adf342b5600554995ac453f8a71820cae1ab59ade9d88612f1210f",
        strip_prefix = "tensorflow-ca0607c19884fc8eb0a4d32a1fe58cc42ced8737",
        link_files = {
            clean_dep("//vendor/tensorflow:third_party/py/python_configure.bzl"): "third_party/py/python_configure.bzl",
        },
    )

    http_archive(
        name = "tfhub_i3d_kinetics_400",
        url = "https://storage.googleapis.com/tfhub-modules/deepmind/i3d-kinetics-400/1.tar.gz",
        sha256 = "bafe29bb4528badad428207d8fe86ca2a998b5b1386b82e42175339f12ea2ff5",
        build_file = clean_dep("//vendor/tensorflow:tfhub_global.BUILD"),
    )

    http_archive(
        name = "tfhub_resnet152",
        url = "https://storage.googleapis.com/tfhub-modules/deepmind/local-linearity/imagenet/1.tar.gz",
        sha256 = "12b60e87833b67dc9f0ee8559de16b5a44b6db2cf0398ae633fb2f8eed66f7f3",
        build_file = clean_dep("//vendor/tensorflow:tfhub_global.BUILD"),
    )

    http_archive(
        name = "tfhub_mobilenet",
        url = "https://storage.googleapis.com/tfhub-modules/google/imagenet/mobilenet_v1_100_224/quantops/classification/3.tar.gz",
        sha256 = "d24047207050e5bf8c23aea638a5032cbf4f25e65fa28827c568984854ec3ffd",
        build_file = clean_dep("//vendor/tensorflow:tfhub_global.BUILD"),
    )
