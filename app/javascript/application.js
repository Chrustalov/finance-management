// Entry point for the build script in your package.json
//= require bootstrap
import Rails from '@rails/ujs';
Rails.start();

import { Turbo } from "@hotwired/turbo-rails";
Turbo.session.drive = false;
import "./controllers";
import 'bootstrap'
import "./jquery"