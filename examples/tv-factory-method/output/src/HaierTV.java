/**
 * HaierTV — 具体产品
 * 海尔电视机，实现 TV 接口
 */
public class HaierTV implements TV {
    @Override
    public void play() {
        System.out.println("海尔电视机正在播放节目...");
    }
}
