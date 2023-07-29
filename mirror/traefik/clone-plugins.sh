for plugin in $(env | grep "$PLUGIN_PREFIX");
do
  # Get the variable name
  plugin_name=$(echo "${plugin}" | cut -d '=' -f1);
  plugin_name=${plugin_name#"${PLUGIN_PREFIX}"}
  # Get the plugin repo from the variable
  plugin_repo=$(echo "${plugin}" | cut -d '=' -f2);
  # Get the version from the VERSION Prefixed variable
  version=$(echo "$VERSION_PREFIX$plugin_name" | cut -d '=' -f2);
  echo "${plugin_name}: Cloning ${plugin_repo} at ${version} into /plugins-local/src/${plugin_repo}";
  # Clone the single "branch" (tag) into the plugins-local folder
  git clone "https://${plugin_repo}" "/plugins-local/src/${plugin_repo}"
    --depth 1 -branch "${version}" --single-branch;
done
