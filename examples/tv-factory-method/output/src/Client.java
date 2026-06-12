/**
 * Client — 客户端
 * 通过工厂方法模式创建电视机，使用抽象工厂和抽象产品编程
 */
public class Client {
    public static void main(String[] args) {
        System.out.println("========== 工厂方法模式演示 ==========\n");

        // 使用海尔工厂创建海尔电视机
        TVFactory haierFactory = new HaierTVFactory();
        TV haierTV = haierFactory.createTV();
        System.out.print("[海尔工厂] 创建电视机 → ");
        haierTV.play();

        // 使用海信工厂创建海信电视机
        TVFactory hisenseFactory = new HisenseTVFactory();
        TV hisenseTV = hisenseFactory.createTV();
        System.out.print("[海信工厂] 创建电视机 → ");
        hisenseTV.play();

        // 演示扩展性：如果未来新增 TCL 品牌，
        // 只需新增 TCLTV 类和 TCLTVFactory 类，
        // 无需修改任何已有代码（开闭原则）
            TVFactory tclFactory = new TCLTVFactory();
            TV tclTV = tclFactory.createTV();
            System.out.print("[TCL工厂] 创建电视机 → ");
            tclTV.play();

        System.out.println("\n========== 演示结束 ==========");
    }
}
