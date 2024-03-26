# About this project
This builds on the first demo of creating a simple CI pipeline with GitHub Actions in a toy dbt project. You can access the first demo in the [datafold-dbt-ci](https://github.com/elliotgunn/datafold-dbt-ci) repository. The two demos are designed to be self-contained; you can run this one without having to run the other first. 

In this second demo, you will incorporate four new integrations into your GitHub Actions workflow for the same project. By the end of this project, you will see a CI pipeline that will, upon a new PR being opened in your dbt project, accomplish four more things:
1. Build and test models that have been modified in your pull request and are downstream of it (**Slim CI**).
2. Automate tests with pre-commit **hooks**. 
3. Validate any data changes at the value-level with Datafold Cloud (**Data Diff**). 
4. Send **Slack notifications** to update your team on the CI pipeline's success or failure. 

## Article and video tutorial
[The article goes into more detail](https://www.datafold.com/blog/taking-your-dbt-ci-pipeline-to-the-next-level) on each step.

I also walk through the same tutorial in this Loom: 

<div>
    <a href="https://www.loom.com/share/0cb4c39f2d8d40fd8ebf379c169a653f">
      <p>Taking your dbt CI pipeline to the next level - Watch Video</p>
    </a>
    <a href="https://www.loom.com/share/0cb4c39f2d8d40fd8ebf379c169a653f">
      <img style="max-width:300px;" src="https://cdn.loom.com/sessions/thumbnails/0cb4c39f2d8d40fd8ebf379c169a653f-1710965586626-with-play.gif">
    </a>
  </div>

## What's in this repo?
It uses [seeds](https://docs.getdbt.com/docs/build/seeds) that includes fake raw data from a fictional app, via dbt lab's [jaffle shop test project](https://github.com/dbt-labs/jaffle_shop). You can also download the data directly [from here](https://github.com/dbt-labs/jaffle_shop/tree/main/seeds).

The best way to learn how to create your first GitHub Actions workflow is to fork this repository and follow our tutorial (link to be added upon publication). As this project is a self-contained example, the best way to learn is to reproduce the results by running this repository before repeating the same steps for your own dbt project. 

You can take a look at what's in our [super simple workflow here](https://github.com/elliotgunn/datafold-dbt-ci/blob/main/.github/workflows/dbt-pr-ci-job.yml) called ```Our first dbt PR job```

By the end of the tutorial, you will have run an advanced CI workflow!

![](/img/static/github-actions-workflow.png)

## An example of how CI works
Imagine you would like to see how changing the threshold for customer loyalty from > 2 to > 4 orders changes the data. 

Here's what a CI workflow should look like. 

1. We'll create a new branch to make our change in. In your terminal:
```
git checkout -b "increase-loyalty-status-threshold"
```

2. Then, update the `dim_customers.sql` file to change the threshold: 

```
case
    when coalesce(customer_orders.number_of_orders, 0) > 4 then 'Loyal'
    else 'Regular'
end as loyalty_status

```

3. Commit the change to your respository and open a new PR. Here's the [open PR from this repository](https://github.com/elliotgunn/datafold-dbt-ci-advanced/pull/3).

4. Wait for our [GitHub Actions workflow](https://github.com/elliotgunn/datafold-dbt-ci-advanced/actions), that was automatically triggered with the opened PR, to finish running. Success! 

![](/img/static/github-actions-workflow-test-pr.png)

Our helpful Datafold bot also leaves a comment on the PR on how the tables were changed in the process:

![](/img/static/datafold-pr-bot.png)

You can now merge to main with the confidence that our modified dbt model did not break anything. 

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

## Acknowledgements
I built this demo in part based on my colleague Sung's wonderful `vhol-demo` [repository](https://github.com/datafold/vhol-demo). Check it out if you would like to learn more hands-on examples of dbt + Datafold CI/CD workflows. 

