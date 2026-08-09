import java.util.Properties

plugins {
    id("com.android.application")
    id("dev.flutter.flutter-gradle-plugin")
}

val keystoreProperties = Properties()
val keystorePropertiesFile = rootProject.file("key.properties")
if (keystorePropertiesFile.exists()) {
    keystorePropertiesFile.inputStream().use(keystoreProperties::load)
}

fun signingValue(propertyName: String, environmentName: String): String? {
    return keystoreProperties
        .getProperty(propertyName)
        ?.takeIf(String::isNotBlank)
        ?: System.getenv(environmentName)?.takeIf(String::isNotBlank)
}

val releaseStoreFile = signingValue("storeFile", "CARECACHE_ANDROID_KEYSTORE_PATH")
val releaseStorePassword = signingValue("storePassword", "CARECACHE_ANDROID_KEYSTORE_PASSWORD")
val releaseKeyAlias = signingValue("keyAlias", "CARECACHE_ANDROID_KEY_ALIAS")
val releaseKeyPassword = signingValue("keyPassword", "CARECACHE_ANDROID_KEY_PASSWORD")
val releaseSigningValues =
    listOf(releaseStoreFile, releaseStorePassword, releaseKeyAlias, releaseKeyPassword)
val releaseSigningConfigured = releaseSigningValues.all { it != null }
val releaseSigningPartiallyConfigured = releaseSigningValues.any { it != null }
val releaseSigningRequired =
    System.getenv("CARECACHE_REQUIRE_RELEASE_SIGNING")?.equals("true", ignoreCase = true) == true

check(!releaseSigningPartiallyConfigured || releaseSigningConfigured) {
    "CareCache release signing is incomplete. Provide every Android signing value."
}
check(!releaseSigningRequired || releaseSigningConfigured) {
    "CareCache distribution builds require Android release-signing credentials."
}

android {
    namespace = "com.vector42.carecache"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        isCoreLibraryDesugaringEnabled = true
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    defaultConfig {
        applicationId = "com.vector42.carecache"
        minSdk = 24
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    signingConfigs {
        if (releaseSigningConfigured) {
            create("release") {
                storeFile = file(requireNotNull(releaseStoreFile))
                storePassword = requireNotNull(releaseStorePassword)
                keyAlias = requireNotNull(releaseKeyAlias)
                keyPassword = requireNotNull(releaseKeyPassword)
            }
        }
    }

    buildTypes {
        release {
            signingConfig =
                if (releaseSigningConfigured) {
                    signingConfigs.getByName("release")
                } else {
                    signingConfigs.getByName("debug")
                }
        }
    }
}

kotlin {
    compilerOptions {
        jvmTarget = org.jetbrains.kotlin.gradle.dsl.JvmTarget.JVM_17
    }
}

flutter {
    source = "../.."
}

dependencies {
    coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:2.1.5")
    implementation("cz.adaptech.tesseract4android:tesseract4android:4.9.0")
}
