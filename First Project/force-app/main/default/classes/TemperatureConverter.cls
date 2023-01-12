public class TemperatureConverter {
	//C = 5/9(F-32)
    public static Decimal fahrenToCelsius(Decimal fn){
        Decimal cl = (fn-32)*5/9;
        return cl;
    }
}
