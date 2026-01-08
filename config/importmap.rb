# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin "bootstrap", to: "bootstrap.bundle.min.js"
pin "sortablejs", to: "https://ga.jspm.io/npm:sortablejs@1.15.6/modular/sortable.esm.js"
pin "@rails/request.js", to: "https://ga.jspm.io/npm:@rails/request.js@0.0.13/src/index.js"
pin "local-time", to: "https://ga.jspm.io/npm:local-time@3.0.3/app/assets/javascripts/local-time.es2017-esm.js"
pin_all_from "app/javascript/controllers", under: "controllers"
