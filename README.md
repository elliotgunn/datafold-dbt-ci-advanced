# About this project
This builds on the first demo of creating a simple CI pipeline with GitHub Actions in a toy dbt project. You can access the first demo in [the main branch](https://github.com/elliotgunn/datafold-dbt-ci). 

In this second demo, you will incorporate four new integrations into your GitHub Actions workflow for the same project. By the end of this project, you will see a CI pipeline that will, upon a new PR being opened in your dbt project, accomplish four more things:
1. Build and test models that have been modified in your pull request and are downstream of it (**Slim CI**).
2. Automate tests with pre-commit **hooks**. 
3. Validate any data changes at the value-level with Datafold Cloud (**Data Diff**). 
4. Send **Slack notifications** to update your team on the CI pipeline's success or failure. 

## Article and video tutorial
The article goes into more detail on each step (to be updated).

I also walk through the same tutorial in this 5 minute Loom (to be updated)

## What's in this repo?
It uses [seeds](https://docs.getdbt.com/docs/build/seeds) that includes fake raw data from a fictional app, via dbt lab's [jaffle shop test project](https://github.com/dbt-labs/jaffle_shop). You can also download the data directly [from here](https://github.com/dbt-labs/jaffle_shop/tree/main/seeds).

The best way to learn how to create your first GitHub Actions workflow is to fork this repository, checkout this branch ([advanced-ci-demo-branch](https://github.com/elliotgunn/datafold-dbt-ci/tree/advanced-ci-demo-branch)) and follow our tutorial (link to be added upon publication). As this project is a self-contained example, the best way to learn is to reproduce the results by running this repository before repeating the same steps for your own dbt project. 

You can take a look at what's in our [super simple workflow here](https://github.com/elliotgunn/datafold-dbt-ci/blob/main/.github/workflows/dbt-pr-ci-job.yml) called ```Our first dbt PR job```

By the end of the tutorial, you will have run an advanced CI workflow!

![](/img/static/github-actions-workflow-advanced.png)

## Tech stack:
- dbt Core
- Snowflake
- GitHub Actions
- Datafold Cloud
- AWS S3

## Resources
Learn more about:
* SQLFluff's [resource for GitHub Actions](https://github.com/sqlfluff/sqlfluff-github-actions)
* [Datafold Cloud](https://www.datafold.com/)
* [dbt](https://docs.getdbt.com/docs/introduction)
