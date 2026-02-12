package exercise4;

public class Flat {

    private int rooms;
    private int squareMeters;
    private int pricePerSquareMeter;

    public Flat(int rooms, int squareMeters, int pricePerSquareMeter) {
        this.rooms = rooms;
        this.squareMeters = squareMeters;
        this.pricePerSquareMeter = pricePerSquareMeter;
    }
    public boolean largerThan(Flat toCompare) {
        return this.squareMeters > toCompare.squareMeters;

    }
    public int priceDifference(Flat toCompare){
        if (this.pricePerSquareMeter > toCompare.pricePerSquareMeter){
        return this.pricePerSquareMeter- toCompare.pricePerSquareMeter;
        }
        else {
            return 0;
        }
    }
}
