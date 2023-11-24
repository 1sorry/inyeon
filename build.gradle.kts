plugins {
    java
    war
    id("org.springframework.boot") version "2.7.15"
    id("io.spring.dependency-management") version "1.0.15.RELEASE"
}

group = "com.example"
version = "0.0.1-SNAPSHOT"

java {
    sourceCompatibility = JavaVersion.VERSION_11
}

configurations {
    compileOnly {
        extendsFrom(configurations.annotationProcessor.get())
    }
}

repositories {
    mavenCentral()
}

configurations {
    all {
        exclude(group = "org.springframework.boot", module = "spring-boot-starter-logging")
        exclude(group = "org.springframework.boot", module = "logback-classic")
    }
}

dependencies {
    implementation("org.springframework.boot:spring-boot-starter-web")
    implementation("org.springframework.boot:spring-boot-starter-web-services")
    compileOnly("org.projectlombok:lombok")
    annotationProcessor("org.projectlombok:lombok")
    providedRuntime("org.springframework.boot:spring-boot-starter-tomcat")
    testImplementation("org.springframework.boot:spring-boot-starter-test")
    implementation ("javax.servlet:jstl")
    implementation ("org.springframework.boot:spring-boot-starter-log4j2")	    // Spring Boot Log4j2
    implementation ("org.apache.tomcat.embed:tomcat-embed-jasper")
    // db연결
    // https://mvnrepository.com/artifact/org.postgresql/postgresql 
    implementation("org.postgresql:postgresql:42.6.0")
    implementation("org.mybatis.spring.boot:mybatis-spring-boot-starter:2.2.0")
    implementation ("org.mybatis:mybatis:3.5.6")
}

tasks.withType<Test> {
    useJUnitPlatform()
}
