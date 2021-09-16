package com.erphero.web.model.response;

import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MultipleResponseData<Vender> extends ResponseData {
    List<Vender> items;
}
