# Set multiple labels at once, using line-continuation characters to break long lines
LABEL vendor="%organisation_name%" \
      com.%organisation_name_lc%.env="%env_type%" \
      com.%organisation_name_lc%.version="%product_version%" \
      com.%organisation_name_lc%.author="%product_instance_owner%" \
      com.%organisation_name_lc%.git_commit_shash="%git_commit_shash%" \
      com.%organisation_name_lc%.git_commit_hash="%git_commit_hash%" \
      com.%organisation_name_lc%.release-date="%timestamp%"
