Build to local:
./gradlew jibDockerBuild

Build to registory:
./gradlew jib

Images created with jib don't set a creation time, "for reproducibility purposes":
https://github.com/GoogleContainerTools/jib/blob/master/docs/faq.md#why-is-my-image-created-48-years-ago
