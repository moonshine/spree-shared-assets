# Shared Assets

This Spree extension creates a many to many relationship between assets and variants allowing
you to share images between variants. By default Spree assigns an image to the product or a
single variant, this means that if you have 6 variants that have the same images you will need
to store the images 6 times once for each variant. This extension allows you to only store an
image once and share that image with the product and any variants.

## Usage

### Installation

Install the extension as normal, once installed you will need to run rake db:migrate to create
the new join table.

There is also a rake task that will create new links for all existing assets, to run do:

rake spree:extensions:shared_assets:copy_shared_assets

### Admin

The admin interface to maintain product images have been modified to allow you to specify which
variants the image should be used with. It also allows you to assign the image to "Product" (named
"All" in default Spree).

The index page will list all images and show which variants they are assigned to, it also shows which
images have been assigned to "Product". To delete an image you need to go into "Edit" and select
the "delete" link which will delete the image and all associated links.

## TODO list

Tests

