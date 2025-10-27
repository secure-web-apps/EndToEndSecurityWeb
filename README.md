# End to end security of a web application

[![License](https://img.shields.io/badge/license-Apache%20License%202.0-blue.svg)](https://github.com/secure-web-apps/EndToEndSecurity/blob/main/LICENSE)

[![.NET and npm build](https://github.com/secure-web-apps/EndToEndSecurity/actions/workflows/dotnet.yml/badge.svg)](https://github.com/secure-web-apps/EndToEndSecurity/actions/workflows/dotnet.yml)
[![SonarCloud](https://github.com/secure-web-apps/EndToEndSecurity/actions/workflows/sonarbuild.yml/badge.svg)](https://github.com/secure-web-apps/EndToEndSecurity/actions/workflows/sonarbuild.yml)

TODO: update badge URLs

[![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=damienbod_EndToEndSecurity&metric=alert_status)](https://sonarcloud.io/summary/overall?id=damienbod_EndToEndSecurity)
[![Bugs](https://sonarcloud.io/api/project_badges/measure?project=damienbod_EndToEndSecurity&metric=bugs)](https://sonarcloud.io/summary/overall?id=damienbod_EndToEndSecurity)
[![Code Smells](https://sonarcloud.io/api/project_badges/measure?project=damienbod_EndToEndSecurity&metric=code_smells)](https://sonarcloud.io/summary/overall?id=damienbod_EndToEndSecurity)
[![Coverage](https://sonarcloud.io/api/project_badges/measure?project=damienbod_EndToEndSecurity&metric=coverage)](https://sonarcloud.io/summary/overall?id=damienbod_EndToEndSecurity)
[![Duplicated Lines (%)](https://sonarcloud.io/api/project_badges/measure?project=damienbod_EndToEndSecurity&metric=duplicated_lines_density)](https://sonarcloud.io/summary/overall?id=damienbod_EndToEndSecurity)
[![Lines of Code](https://sonarcloud.io/api/project_badges/measure?project=damienbod_EndToEndSecurity&metric=ncloc)](https://sonarcloud.io/summary/overall?id=damienbod_EndToEndSecurity)
[![Reliability Rating](https://sonarcloud.io/api/project_badges/measure?project=damienbod_EndToEndSecurity&metric=reliability_rating)](https://sonarcloud.io/summary/overall?id=damienbod_EndToEndSecurity)
[![Security Rating](https://sonarcloud.io/api/project_badges/measure?project=damienbod_EndToEndSecurity&metric=security_rating)](https://sonarcloud.io/summary/overall?id=damienbod_EndToEndSecurity)
[![Technical Debt](https://sonarcloud.io/api/project_badges/measure?project=damienbod_EndToEndSecurity&metric=sqale_index)](https://sonarcloud.io/summary/overall?id=damienbod_EndToEndSecurity)
[![Maintainability Rating](https://sonarcloud.io/api/project_badges/measure?project=damienbod_EndToEndSecurity&metric=sqale_rating)](https://sonarcloud.io/summary/overall?id=damienbod_EndToEndSecurity)
[![Vulnerabilities](https://sonarcloud.io/api/project_badges/measure?project=damienbod_EndToEndSecurity&metric=vulnerabilities)](https://sonarcloud.io/summary/overall?id=damienbod_EndToEndSecurity)

This repository is used to host the source code for our .NET User Group Switzerland tour.

## Introduction

:memo: [Using SonarCloud with ASP.NET Core, Angular and github actions](https://damienbod.com/2024/05/13/using-sonarcloud-with-asp-net-core-angular-and-github-actions/)

:tv: [Webinar](https://www.youtube.com/watch?v=6cdV-oN_Yao)

## Setup and docs

https://github.com/damienbod/bff-aspnetcore-angular

![BFF production](https://github.com/damienbod/EndToEndSecurity/blob/main/images/bff-arch-production_01.png)

## Agenda

- User authentication
- Identity authentication
- Secure APIs
- Session security
- DevSecOps

// CONTINUE HERE

- Application setup development/production
  - [ASP.NET Core/Angular](https://github.com/damienbod/bff-aspnetcore-angular)
  - Secrets
- Authentication
  - [OpenID Connect Code flow confidential client](https://github.com/damienbod/EndToEndSecurity/blob/main/images/OIDC%20Code%20flow.md)
  - [PKCE](https://github.com/damienbod/EndToEndSecurity/blob/main/images/PKCE.md)
- Microsoft Entra ID
  - Microsoft.Identity.Web
  - Microsoft Graph 5 for profile data
  - Profile data in UI (UserController)
- Session protection
- CI/CD
  - [build](.github/workflows/dotnet.yml)
  - [deployment](.github/workflows/azure-webapps-dotnet-core.yml)
- CI/CD Quality (SonarCloud)
  - [quality (SonarCloud and github actions)](.github/workflows/sonarbuild.yml)
  - Analysis for different technical stacks (.csproj)
  - sonar badges, build badges

## Other topics

- What's missing for a productive setup?
  - infrastructure automation (terraform/biceps)
  - authorization
  - data requirements

## Angular nx Updates

```
nx migrate latest

nx migrate --run-migrations=migrations.json
```

## History

- 2025-08-30 Updated packages, Angular 20
- 2025-01-01 .NET 9, Angular 19
- 2024-10-17 Updated security headers performance, updated packages
- 2024-10-06 Updated Angular 18.2.7, Updated security headers

## Links

https://docs.sonarsource.com/sonarcloud/getting-started/github/

https://github.com/rufer7/github-sonarcloud-integration

https://blog.rufer.be/2023/10/06/howto-integrate-sonarcloud-analysis-in-an-azure-devops-yaml-pipeline/

https://community.sonarsource.com/t/code-coverage-report-for-net-not-working-on-linux-agent/62087

https://docs.sonarsource.com/sonarcloud/advanced-setup/ci-based-analysis/sonarscanner-for-net/#analyzing-languages-other-than-c-and-vb

https://andreiepure.ro/2023/08/20/analyze-web-files-with-s4net.html

https://github.com/damienbod/bff-aspnetcore-angular

https://community.sonarsource.com/t/webinar-end-to-end-security-in-a-web-application/115405
