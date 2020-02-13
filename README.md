The Dockerfile builds an image for this particular java jar. The version must be passed in the "docker build" command,
e.g. "--build-arg app_ver=1.0-SNAPSHOT". This would have to be automated in the build/release system so the
automatically tagged version number is used instead of manually specifying.

Another option is Google's jib library, which can build an deploy an image for you, without needing a Dockerfile.
For example:

Build to local:
./gradlew jibDockerBuild

Build to registory:
./gradlew jib

Images created with jib don't set a creation time, "for reproducibility purposes":
https://github.com/GoogleContainerTools/jib/blob/master/docs/faq.md#why-is-my-image-created-48-years-ago

The main/jib folder is added to the image, so this provides a way to add conf/ and logs/ directories without having
access to a raw Dockerfile
