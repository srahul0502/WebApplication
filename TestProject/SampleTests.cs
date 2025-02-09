using Xunit;

public class SampleTests
{
    [Fact]
    public void TestSum()
    {
        int a = 2;
        int b = 3;
        Assert.Equal(5, a + b);
    }
}
