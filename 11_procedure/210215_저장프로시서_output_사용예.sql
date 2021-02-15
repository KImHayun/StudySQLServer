declare @newResult int;
set @newResult = 0;
exec plusNew 3, 4, @newResult output;
print concat('PlusNew(3, 4) = ', @newResult); 
print concat('PlusNew(3, 4) = ', @newResult);


/*
C#에서는 아래와 같음
static void Main(string[] args)
{
    int newResult;
    plusNew(3, 4, out newResult);
    Console.WriteLine($"plusNew(3, 4) = {newResult}");
}
private static void plusNew(int p1, int p2, out int pout)
{
    pout = p1 + p2;
}
*/