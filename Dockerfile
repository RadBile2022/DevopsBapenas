FROM openjdk:8
EXPOSE 8080
ADD target/java-book.jar java-book.jar
ENTRYPOINT ["java","-jar","/java-book.jar"]
