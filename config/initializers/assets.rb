# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = "1.0"

# Add additional assets to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('app', 'assets', 'fonts')
Rails.application.config.assets.paths << Rails.root.join('app', 'assets', 'builds', 'js')
Rails.application.config.assets.paths << Rails.root.join('app', 'assets', 'builds', 'css')


# YOU CAN ADD VENDOR ASSETS EITHER BY paths OR precompile
# Rails.application.config.assets.paths << Rails.root.join('vendor', 'assets', 'javascripts')
# Rails.application.config.assets.paths << Rails.root.join('vendor', 'assets', 'stylesheets')
Rails.application.config.assets.precompile += [
  Rails.root.join('vendor/assets/javascripts/*').to_s,
  Rails.root.join('vendor/assets/stylesheets/*').to_s
]


# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )
