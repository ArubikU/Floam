plugins {
    java
    id("com.gradleup.shadow") version "8.3.5"
}

group = "dev.arubiku"
version = "2.0.0-dev"

java {
    toolchain.languageVersion.set(JavaLanguageVersion.of(21))
}

repositories {
    mavenCentral()
    maven("https://repo.papermc.io/repository/maven-public/")
}

dependencies {
    // Paper 1.21.x API — Bukkit/Paper, brigadier commands, Adventure, EquippableComponent, ServerBuildInfo.
    // Floamy3D uses no NMS, so the plain API is sufficient (no paperweight remap needed).
    compileOnly("io.papermc.paper:paper-api:1.21.4-R0.1-SNAPSHOT")

    // Shaded runtime libraries (relocated under dev.arubiku.floamy3d.libs.* by shadowJar)
    implementation("com.fasterxml.jackson.core:jackson-databind:2.18.2")
    implementation("commons-io:commons-io:2.18.0")

    testImplementation("org.junit.jupiter:junit-jupiter:5.11.3")
    testRuntimeOnly("org.junit.platform:junit-platform-launcher")
}

tasks.test {
    useJUnitPlatform()
}

tasks {
    compileJava {
        options.encoding = "UTF-8"
        options.release.set(21)
    }

    shadowJar {
        archiveClassifier.set("")
        relocate("com.fasterxml.jackson", "dev.arubiku.floamy3d.libs.jackson")
        relocate("org.apache.commons.io", "dev.arubiku.floamy3d.libs.commons.io")
        mergeServiceFiles()
    }

    build {
        dependsOn(shadowJar)
    }
}
