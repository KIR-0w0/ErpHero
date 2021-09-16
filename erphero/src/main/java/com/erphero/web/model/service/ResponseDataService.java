package com.erphero.web.model.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.erphero.web.model.response.MultipleResponseData;
import com.erphero.web.model.response.ResponseData;
import com.erphero.web.model.response.SingleResponseData;

@Service
public class ResponseDataService {

    public <T> SingleResponseData<T> getSingleResponseData(T item) {
        SingleResponseData<T> response = new SingleResponseData<>();
        response.setItem(item);
        setSuccessData(response);
        return response;
    }

    public <T> MultipleResponseData<T> getMultipleResponseData(List<T> items) {
        MultipleResponseData<T> response = new MultipleResponseData<>();
        response.setItems(items);
        setSuccessData(response);
        return response;
    }

    public ResponseData getFailResponseData(String message) {
        ResponseData response = new ResponseData();
        response.setSuccess(false);
        response.setMessage(message);
        return response;
    }

    private void setSuccessData(ResponseData item) {
        item.setSuccess(true);
        item.setMessage("성공");
    }
}
