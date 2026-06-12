/**
 * HisenseTV — 具体产品
 * 海信电视机，实现 TV 接口
 */
public class HisenseTV implements TV {
    @Override
    public void play() {
        System.out.println("海信电视机正在播放节目...");
    }
}
