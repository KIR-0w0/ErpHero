package com.erphero.web.model.response;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SingleResponseData<T> extends ResponseData {
    T item;
}
