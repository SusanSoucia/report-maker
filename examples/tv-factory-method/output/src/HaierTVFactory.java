/**
 * HaierTVFactory — 具体工厂
 * 负责创建海尔电视机
 */
public class HaierTVFactory implements TVFactory {
    @Override
    public TV createTV() {
        return new HaierTV();
    }
}
