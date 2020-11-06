package edu.canm.deepdive.codebreaker.configuration;

import java.util.NoSuchElementException;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestControllerAdvice;

@Configuration
@RestControllerAdvice
public class ErrorConfiguration {

  @ExceptionHandler({NoSuchElementException.class})
  @ResponseStatus(value = HttpStatus.NOT_FOUND, reason = "Reason not found")
  public void notFound() {}

}
