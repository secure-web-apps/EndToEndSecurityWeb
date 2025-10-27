namespace BffMicrosoftEntraID.Server.Security;

public static class DefaultSecurityHeadersDefinitions
{
    private static HeaderPolicyCollection? _policy;

    public static HeaderPolicyCollection GetHeaderPolicyCollection(bool isDev, string? idpHost)
    {
        ArgumentNullException.ThrowIfNullOrWhiteSpace(idpHost);

        // Avoid building a new HeaderPolicyCollection on every request for performance reasons.
        // Where possible, cache and reuse HeaderPolicyCollection instances.
        if (_policy is not null)
        {
            return _policy;
        }

        _policy = new HeaderPolicyCollection()
            .AddFrameOptionsDeny()
            .AddContentTypeOptionsNoSniff()
            .AddReferrerPolicyStrictOriginWhenCrossOrigin()
            .AddCrossOriginOpenerPolicy(builder => builder.SameOrigin())
            .AddCrossOriginResourcePolicy(builder => builder.SameOrigin())
            .AddCrossOriginEmbedderPolicy(builder => builder.RequireCorp()) // remove for dev if using hot reload
            .AddContentSecurityPolicy(builder =>
            {
                builder.AddObjectSrc().None();
                builder.AddBlockAllMixedContent();
                builder.AddImgSrc().Self().From("data:");
                builder.AddFormAction().Self().From(idpHost);
                builder.AddFontSrc().Self();
                builder.AddBaseUri().Self();
                builder.AddFrameAncestors().None();

                if (isDev)
                {
                    builder.AddStyleSrc().Self().UnsafeInline();
                }
                else
                {
                    builder.AddStyleSrc().WithNonce().UnsafeInline();
                }

                builder.AddScriptSrc().WithNonce().UnsafeInline();
            })
            .RemoveServerHeader()
            .AddPermissionsPolicyWithDefaultSecureDirectives();

        if (!isDev)
        {
            // max-age = one year in seconds
            _policy.AddStrictTransportSecurityMaxAgeIncludeSubDomainsAndPreload();
        }

        return _policy;
    }
}
