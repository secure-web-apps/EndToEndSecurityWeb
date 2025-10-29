using Microsoft.Extensions.Hosting;

var builder = DistributedApplication.CreateBuilder(args);

if (builder.Environment.IsDevelopment())
{
    var angularFrontend = builder.AddNpmApp("angular", "../ui", "start")
        .WithHttpsEndpoint(port: 3000, 4201, env: "BASE_URL");

    builder.AddProject<Projects.BffMicrosoftEntraID_Server>("bffmicrosoftentraid-server")
        .WithReference(angularFrontend)
        .WaitFor(angularFrontend)
        .WithExternalHttpEndpoints();
}
else
{
    // Hint: to make this work, the deployment pipeline must execute npm run build
    builder.AddProject<Projects.BffMicrosoftEntraID_Server>("bffmicrosoftentraid-server")
        .WithExternalHttpEndpoints();
}

await builder.Build().RunAsync();
