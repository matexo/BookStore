package com.library.dto;

/**
 * Created by Matexo on 2016-06-23.
 */
public class OrderStatusDTO {

    private String orderNumber;
    private Boolean isShipped;
    private String shippmentTracking;
    private Boolean isPaid;

    public String getOrderNumber() {
        return orderNumber;
    }

    public void setOrderNumber(String orderNumber) {
        this.orderNumber = orderNumber;
    }

    public Boolean getShipped() {
        return isShipped;
    }

    public void setShipped(Boolean shipped) {
        isShipped = shipped;
    }

    public String getShippmentTracking() {
        return shippmentTracking;
    }

    public void setShippmentTracking(String shippmentTracking) {
        this.shippmentTracking = shippmentTracking;
    }

    public Boolean getPaid() {
        return isPaid;
    }

    public void setPaid(Boolean paid) {
        isPaid = paid;
    }
}
