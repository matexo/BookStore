package com.library.controller;


import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by Matexo on 2016-06-14.
 */
@Controller
public class ViewController {

    private final Logger log = Logger.getLogger(this.getClass());

    @RequestMapping(value = "", method = RequestMethod.GET)
    public String mainView() {
        return "home";
    }

    @RequestMapping(value = "products", method = RequestMethod.GET)
    public String productView() // products + kategorie + filtorwanie w angularze
    {
        return "products";
    }

    @RequestMapping(value = "products/info/{productId}", method = RequestMethod.GET)
    public String productInfoView(@PathVariable Long productId) // showMore
    {
        return "productInfo";
    }

    @RequestMapping(value = "order/status/", method = RequestMethod.GET)
    public String orderStatusView() // orderCheck
    {
        return "orderStatus";
    }

    @RequestMapping(value = "order/finalize/customerinfo" , method = RequestMethod.GET) //dane klienta
    public String customerInfoView()
    {
        return "customerInfo"; //getCustomerInfo
    }

    @RequestMapping(value = "order/finalize/order") // cale zamowienie
    public String orderView()
    {
        return "order";
    }

    @RequestMapping(value = "userForm", method = RequestMethod.GET)
    public String userFormView() {
        return "userForm";
    }

    @RequestMapping(value = "user/orders", method = RequestMethod.GET)
    public String userOrdersView() {
        return "userOrders";
    }

    @RequestMapping(value = "login", method = RequestMethod.GET)
    public String loginView() {
        return "login";
    }

    @RequestMapping(value = "logout", method = RequestMethod.GET)
    public String logoutView() {
        return "login";
    }

    @RequestMapping(value = "cart", method = RequestMethod.GET)
    public String cartView() {
        return "cart";
    }

    @RequestMapping(value = "admin", method = RequestMethod.GET) // admin
    public String adminMenuView()
    {
        return "adminMenu";
    }

    @RequestMapping(value = "admin/products" , method = RequestMethod.GET)
    public String adminProductView()
    {
        return "productList";
    }

    @RequestMapping(value = "admin/products/form" , method = RequestMethod.GET)
    public String adminProductFormView()
    {
        return "productForm";
    }

    @RequestMapping(value = "admin/orders" , method = RequestMethod.GET)
    public String adminOrderView()
    {
        return "orderList";
    }
}
