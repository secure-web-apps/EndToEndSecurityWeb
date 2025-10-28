using Microsoft.AspNetCore.Mvc.Testing;
using System.Net.Http.Json;

namespace BffMicrosoftEntraID.Server.IntegrationTests;

public class UserEndpointsTests : IClassFixture<WebApplicationFactory<Program>>
{
    private readonly WebApplicationFactory<Program> _factory;

    public UserEndpointsTests(WebApplicationFactory<Program> factory)
    {
        _factory = factory;
    }

    [Fact]
    public async Task Get_AsUnauthenticatedUser_ReturnsAnonymousUserInfo()
    {
        // Arrange
        var client = _factory.CreateClient();

        // Act
        var response = await client.GetAsync("/api/user");

        // Assert
        response.EnsureSuccessStatusCode();
        var userInfo = await response.Content.ReadFromJsonAsync<Models.UserInfo>();
        Assert.NotNull(userInfo);
        Assert.False(userInfo!.IsAuthenticated);
    }
}
