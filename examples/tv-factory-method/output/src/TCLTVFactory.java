public class TCLTVFactory implements TVFactory {
    @Override
    public TV createTV() {
        return new TCLTV();
    }   
}
