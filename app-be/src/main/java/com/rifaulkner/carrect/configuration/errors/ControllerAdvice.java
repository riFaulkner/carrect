package com.rifaulkner.carrect.configuration.errors;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.NoHandlerFoundException;

import java.util.ArrayList;
import java.util.List;

@ControllerAdvice
class ControllerExceptionHandler {
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    @ExceptionHandler(MethodArgumentNotValidException.class)
    @ResponseBody
    ErrorResult handleMethodArgumentNotValidException(MethodArgumentNotValidException e) {
        ErrorResult errorResult = new ErrorResult();
        for (FieldError fieldError : e.getBindingResult().getFieldErrors()) {
            errorResult.getFieldErrors()
                    .add(new FieldValidationError(fieldError.getField(),
                            fieldError.getDefaultMessage()));
        }
        return errorResult;
    }


    @ResponseStatus(HttpStatus.NOT_FOUND)
    @ExceptionHandler(NoHandlerFoundException.class)
    @ResponseBody
    ErrorResult handlePageNotFoundException(NoHandlerFoundException e) {
        ErrorResult errorResult = new ErrorResult();
        FieldValidationError fieldError = new FieldValidationError("Page Error", "Not Found");
        errorResult.getFieldErrors().add(fieldError);
        return errorResult;
    }

    @Getter
    @NoArgsConstructor
    static class ErrorResult {
        private final List<FieldValidationError> fieldErrors = new ArrayList<>();
        ErrorResult(String field, String message){
            this.fieldErrors.add(new FieldValidationError(field, message));
        }
    }

    @Getter
    @AllArgsConstructor
    static class FieldValidationError {
        private String field;
        private String message;
    }

}