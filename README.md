# Turborepo kitchen sink starter

This Turborepo starter is maintained by the Turborepo core team.

This example also shows how to use [Workspace Configurations](https://turborepo.com/docs/core-concepts/monorepos/configuring-workspaces).

## Using this example

Run the following command:

```sh
npx create-turbo@latest -e kitchen-sink
```

## What's inside?

This Turborepo includes the following packages and apps:

### Apps and Packages

- `api`: an [Express](https://expressjs.com/) server
- `storefront`: a [Next.js](https://nextjs.org/) app
- `admin`: a [Vite](https://vitejs.dev/) single page app
- `blog`: a [Remix](https://remix.run/) blog
- `@repo/jest-presets`: Jest configurations
- `@repo/logger`: isomorphic logger (a small wrapper around console.log)
- `@repo/ui`: a dummy React UI library (which contains `<CounterButton>` and `<Link>` components)
- `@repo/typescript-config`: tsconfig.json's used throughout the monorepo

Each package and app is 100% [TypeScript](https://www.typescriptlang.org/).

### Utilities

This Turborepo has some additional tools already setup for you:

- [TypeScript](https://www.typescriptlang.org/) for static type checking
- [Biome](https://next.biomejs.dev/) [![Checked with Biome](https://img.shields.io/badge/Checked_with-Biome-60a5fa?style=flat&logo=biome)](https://biomejs.dev)
- [Jest](https://jestjs.io) test runner for all things JavaScript
