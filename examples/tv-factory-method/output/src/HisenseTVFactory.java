/**
 * HisenseTVFactory — 具体工厂
 * 负责创建海信电视机
 */
public class HisenseTVFactory implements TVFactory {
    @Override
    public TV createTV() {
        return new HisenseTV();
    }
}
