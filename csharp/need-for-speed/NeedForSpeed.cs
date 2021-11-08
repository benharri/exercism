class RemoteControlCar
{
    private readonly int Speed;
    private readonly int BatteryDrain;
    private int Battery;
    private int Driven;

    public RemoteControlCar(int speed, int batteryDrain)
    {
        Speed = speed;
        BatteryDrain = batteryDrain;
        Battery = 100;
        Driven = 0;
    }

    public bool BatteryDrained() => Battery < BatteryDrain;

    public int DistanceDriven() => Driven;

    public void Drive()
    {
        if (BatteryDrained()) return;
        Battery -= BatteryDrain;
        Driven += Speed;
    }

    public static RemoteControlCar Nitro() => new RemoteControlCar(50, 4);
}

class RaceTrack
{
    private readonly int Distance;

    public RaceTrack(int distance)
    {
        Distance = distance;
    }

    public bool CarCanFinish(RemoteControlCar car)
    {
        while (car.DistanceDriven() < Distance)
        {
            if (car.BatteryDrained()) return false;
            car.Drive();
        }
        return true;
    }
}
