# End to end security of a web application

[![License](https://img.shields.io/badge/license-Apache%20License%202.0-blue.svg)](https://github.com/secure-web-apps/EndToEndSecurityWeb/blob/main/LICENSE)

[![.NET and npm build](https://github.com/secure-web-apps/EndToEndSecurityWeb/actions/workflows/dotnet-and-npm-build.yml/badge.svg)](https://github.com/secure-web-apps/EndToEndSecurityWeb/actions/workflows/dotnet-and-npm-build.yml)
[![SonarCloud](https://github.com/secure-web-apps/EndToEndSecurityWeb/actions/workflows/quality.yml/badge.svg)](https://github.com/secure-web-apps/EndToEndSecurityWeb/actions/workflows/quality.yml)
[![Build, apply IaC and deploy to Azure App Service](https://github.com/secure-web-apps/EndToEndSecurityWeb/actions/workflows/deploy-to-azure.yml/badge.svg)](https://github.com/secure-web-apps/EndToEndSecurityWeb/actions/workflows/deploy-to-azure.yml)

[![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=secure-web-apps_EndToEndSecurityWeb&metric=alert_status&token=0d4ca287da2bcdd568de817048e1ff5ee611afe0)](https://sonarcloud.io/summary/overall?id=secure-web-apps_EndToEndSecurityWeb)
[![Bugs](https://sonarcloud.io/api/project_badges/measure?project=secure-web-apps_EndToEndSecurityWeb&metric=bugs&token=0d4ca287da2bcdd568de817048e1ff5ee611afe0)](https://sonarcloud.io/summary/overall?id=secure-web-apps_EndToEndSecurityWeb)
[![Code Smells](https://sonarcloud.io/api/project_badges/measure?project=secure-web-apps_EndToEndSecurityWeb&metric=code_smells&token=0d4ca287da2bcdd568de817048e1ff5ee611afe0)](https://sonarcloud.io/summary/overall?id=secure-web-apps_EndToEndSecurityWeb)
[![Coverage](https://sonarcloud.io/api/project_badges/measure?project=secure-web-apps_EndToEndSecurityWeb&metric=coverage&token=0d4ca287da2bcdd568de817048e1ff5ee611afe0)](https://sonarcloud.io/summary/overall?id=secure-web-apps_EndToEndSecurityWeb)
[![Duplicated Lines (%)](https://sonarcloud.io/api/project_badges/measure?project=secure-web-apps_EndToEndSecurityWeb&metric=duplicated_lines_density&token=0d4ca287da2bcdd568de817048e1ff5ee611afe0)](https://sonarcloud.io/summary/overall?id=secure-web-apps_EndToEndSecurityWeb)
[![Lines of Code](https://sonarcloud.io/api/project_badges/measure?project=secure-web-apps_EndToEndSecurityWeb&metric=ncloc&token=0d4ca287da2bcdd568de817048e1ff5ee611afe0)](https://sonarcloud.io/summary/overall?id=secure-web-apps_EndToEndSecurityWeb)
[![Reliability Rating](https://sonarcloud.io/api/project_badges/measure?project=secure-web-apps_EndToEndSecurityWeb&metric=reliability_rating&token=0d4ca287da2bcdd568de817048e1ff5ee611afe0)](https://sonarcloud.io/summary/overall?id=secure-web-apps_EndToEndSecurityWeb)
[![Security Rating](https://sonarcloud.io/api/project_badges/measure?project=secure-web-apps_EndToEndSecurityWeb&metric=security_rating&token=0d4ca287da2bcdd568de817048e1ff5ee611afe0)](https://sonarcloud.io/summary/overall?id=secure-web-apps_EndToEndSecurityWeb)
[![Technical Debt](https://sonarcloud.io/api/project_badges/measure?project=secure-web-apps_EndToEndSecurityWeb&metric=sqale_index&token=0d4ca287da2bcdd568de817048e1ff5ee611afe0)](https://sonarcloud.io/summary/overall?id=secure-web-apps_EndToEndSecurityWeb)
[![Maintainability Rating](https://sonarcloud.io/api/project_badges/measure?project=secure-web-apps_EndToEndSecurityWeb&metric=sqale_rating&token=0d4ca287da2bcdd568de817048e1ff5ee611afe0)](https://sonarcloud.io/summary/overall?id=secure-web-apps_EndToEndSecurityWeb)
[![Vulnerabilities](https://sonarcloud.io/api/project_badges/measure?project=secure-web-apps_EndToEndSecurityWeb&metric=vulnerabilities&token=0d4ca287da2bcdd568de817048e1ff5ee611afe0)](https://sonarcloud.io/summary/overall?id=secure-web-apps_EndToEndSecurityWeb)

This repository hosts the source code for our .NET User Group Switzerland tour.

## Introduction

:memo: [Using SonarCloud with ASP.NET Core, Angular and github actions](https://damienbod.com/2024/05/13/using-sonarcloud-with-asp-net-core-angular-and-github-actions/)

:tv: [Webinar](https://www.youtube.com/watch?v=6cdV-oN_Yao)

## Setup and docs

[ASP.NET Core/Angular](https://github.com/damienbod/bff-aspnetcore-angular)

![BFF production](https://github.com/secure-web-apps/EndToEndSecurityWeb/blob/main/images/bff-arch-production_01.png)

## Agenda

- User Authentication
- Identity Authentication
  - [OpenID Connect Code flow confidential client](https://github.com/secure-web-apps/EndToEndSecurityWeb/blob/main/images/OIDC%20Code%20flow.md)
  - [PKCE](https://github.com/secure-web-apps/EndToEndSecurityWeb/blob/main/images/PKCE.md)
  - Microsoft Entra ID
    - `Microsoft.Identity.Web`
    - Microsoft Graph 5 for profile data
    - Profile data in UI (UserController)
- Secure APIs
- Session Security
- DevSecOps
  - [build](.github/workflows/dotnet-and-npm-build.yml)
  - [deploy (IaC & app)](.github/workflows/deploy-to-azure.yml)
  - [quality (SonarQube Cloud)](.github/workflows/quality.yml)
  - Analysis for different technical stacks (.csproj)
  - sonar badges, build badges

## Other topics

- What's missing for a production setup?
  - infrastructure automation (terraform/bicep)
  - authorization
  - data requirements

## Angular nx Updates

```cmd
nx migrate latest

nx migrate --run-migrations=migrations.json
```

## History

- 2025-10-31 Updated packages, added terraform, sonar SCA, SAST, improve pipelines
- 2025-08-30 Updated packages, Angular 20
- 2025-01-01 .NET 9, Angular 19
- 2024-10-17 Updated security headers performance, updated packages
- 2024-10-06 Updated Angular 18.2.7, updated security headers
- 2025-10-27 Updated NuGet packages
- 2025-10-28 Updated frontend packages, added integration tests, added GitHub Actions workflows
- 2025-10-30 Fixed deployment to Azure App Service, reverted Angular due to CSP nonce issues

## Links

- [SonarQube Cloud - Analyzing GitHub projects](https://docs.sonarsource.com/sonarcloud/getting-started/github/)
- [rufer7 - github-sonarcloud-integration](https://github.com/rufer7/github-sonarcloud-integration)
- [[HOWTO] Integrate SonarCloud analysis in an Azure DevOps YAML pipeline](https://blog.rufer.be/2023/10/06/howto-integrate-sonarcloud-analysis-in-an-azure-devops-yaml-pipeline/)
- [Sonar Community - Code coverage report for .Net not working on Linux agent](https://community.sonarsource.com/t/code-coverage-report-for-net-not-working-on-linux-agent/62087)
- [SonarScanner for .NET - Analyzing languages other than C# and VB](https://docs.sonarsource.com/sonarcloud/advanced-setup/ci-based-analysis/sonarscanner-for-net/#analyzing-languages-other-than-c-and-vb)
- [Andrei Epure - How to analyze JS/TS, HTML and CSS files with the Sonar Scanner for .NET](https://andreiepure.ro/2023/08/20/analyze-web-files-with-s4net.html)
- [damienbod - bff-aspnetcore-angular](https://github.com/damienbod/bff-aspnetcore-angular)
- [[Webinar] End-to-end security in a web application](https://community.sonarsource.com/t/webinar-end-to-end-security-in-a-web-application/115405)
- [Tutorial: Add Aspire to an existing .NET app](https://learn.microsoft.com/en-us/dotnet/aspire/get-started/add-aspire-existing-app?WT.mc_id=MVP_344197)
- [Orchestrate Node.js apps in Aspire](https://learn.microsoft.com/en-us/dotnet/aspire/get-started/build-aspire-apps-with-nodejs?WT.mc_id=MVP_344197)
- [Deploy to Azure App Service by using GitHub Actions](https://learn.microsoft.com/en-us/azure/app-service/deploy-github-actions?WT.mc_id=MVP_344197)
