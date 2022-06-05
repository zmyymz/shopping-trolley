package entity;

/**
 * 购物车项实体类
 * 用于封装购物车中的商品信息及数量
 */
public class CartItem {
    /**
     * 商品对象
     */
    private Product p;
    /**
     * 商品购买数量
     */
    private int sum;

    /**
     * 获取商品对象
     *
     * @return 商品对象
     */
    public Product getP() {
        return p;
    }

    /**
     * 设置商品对象
     *
     * @param p 商品对象
     */
    public void setP(Product p) {
        this.p = p;
    }

    /**
     * 获取商品购买数量
     *
     * @return 购买数量
     */
    public int getSum() {
        return sum;
    }

    /**
     * 设置商品购买数量
     *
     * @param sum 购买数量
     */
    public void setSum(int sum) {
        this.sum = sum;
    }
}
