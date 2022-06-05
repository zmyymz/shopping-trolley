<%@ page language="java" import="dao.*,entity.*,java.util.*"
         contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    //1.获得购物车Map,这里一开始没有设置,是null,等执行完一次,session.getAttribute("cart")就不空了.
    //getAttribute的返回值类型是Object,需要向下转型,
    //转成你的userName类型的,简单说就是存什么,取出来还是什么.
    HashMap map = (HashMap) session.getAttribute("cart");

    //2.判断购物车Map是否存在,不存在则创建
    if (map == null) {
        map = new HashMap();

    }

    //3. 把产品添加到购物车
    //3.1 根据id获得添加购物的产品
    //int id = Integer.parseInt(request.getParameter("id"));
    String id = request.getParameter("id");
    ProductDaoImp dao = new ProductDaoImp();
    Product p = dao.findById(Integer.parseInt(id));
    //3.2 判断Map中是否由此商品 , 注意这里id不加引号
    CartItem cartItem = (CartItem) map.get(id);
    if (cartItem != null) {
        //有--> 把数量+1
        cartItem.setSum(cartItem.getSum() + 1);
    } else {
        //无--> 把商品放入购物车 数量为1
        cartItem = new CartItem();
        cartItem.setP(p);
        cartItem.setSum(1);
    }
    ///3.3 产品加入集合,id+""拼接成字符串型
    map.put(id, cartItem); //{id,cartItem{产品,数量}} 举例 {"1",{"坚果",2}}
    //out.print(map.size());

    //4.把集合存储到session作用域
    session.setAttribute("cart", map);
    response.sendRedirect("cart.jsp");
%>