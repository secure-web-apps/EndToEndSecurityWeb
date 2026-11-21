using Microsoft.Extensions.Hosting;

var builder = DistributedApplication.CreateBuilder(args);

if (builder.Environment.IsDevelopment())
{
    var angularFrontend = builder.AddJavaScriptApp("angular", "../ui", "start")
        .WithHttpsEndpoint(port: 3000, 4201, env: "BASE_URL");

    builder.AddDotnetProject("bffmicrosoftentraid-server", "../server/BffMicrosoftEntraID.Server.csproj")
        .WithReference(angularFrontend)
        .WaitFor(angularFrontend)
        .WithExternalHttpEndpoints();
}
else
{
    // Hint: to make this work, the deployment pipeline must execute npm run build
    builder.AddDotnetProject("bffmicrosoftentraid-server", "../server/BffMicrosoftEntraID.Server.csproj")
        .WithExternalHttpEndpoints();
}

await builder.Build().RunAsync();
