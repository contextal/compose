# Contextal Platform and Console #

We provide a *Docker Compose* environment that lets you quickly bring up and test the full [Contextal Platform](https://platform.contextal.com/docs/welcome) package.

This setup can also optionally start an instance of [Contextal Console](https://platform.contextal.com/console).

Please note that this setup is intended for local use (testing, experimentation, etc.) and is **not recommended for production**. For production environments, we recommend deploying the software to a Kubernetes cluster using the [Helm chart](https://platform.contextal.com/docs/installation/k8s).

# Quick setup #

1. Clone this repository
2. To start the platform only, run:
   ```
   docker compose up -d
   ```
   To start both the platform and the console, use:
   ```
   docker compose --profile console up -d
   ```

You can interact with Contextal Platform through:
* [Platform API](https://platform.contextal.com/docs/api/intro)
* [Command line tools](https://platform.contextal.com/tutorial/category/command-line)
* Console instance (if enabled): access via browser at http://localhost:8000


# Exposed services #

* **Platform API**: available at `localhost:8080`
* **Console (if enabled)**: available at `localhost:8000`
* **Grafana**: monitoring and alerting (with several pre-generated dashboards).
  Access at http://localhost:8888; log in initially as `admin`/`admin`.

# Customization #

The compose file is easily customizable through environment variables. For example, all default passwords can be modified.

However, we do not recommend altering the default [Data Processors](https://platform.contextal.com/docs/data-processing/data-processors/intro) configuration unless you are familiar with the platform’s inner details.

# Object data retention #

While work results and actions are retained indefinitely, the object data is regularly evicted to prevent clutter and keep disk usage under control.
The `OBJECTS_MAX_AGE_MINS` environment variable sets the life time (in minutes) of the data; the default is 1 day (1440 minutes).

The value can be modified as needed but we recommend a minimum of 120 minutes (2 hours) to avoid interfering with the platform activities.

# Documentation #

For comprehensive documentation on Contextal Platform, visit https://platform.contextal.com.
