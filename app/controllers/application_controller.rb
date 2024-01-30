class ApplicationController < ActionController::Base
  def render_with_flash(*args)
    options = args.extract_options!

    if (alert = options.delete(:alert))
      flash.now[:alert] = alert
    end

    if (notice = options.delete(:notice))
      flash.now[:notice] = notice
    end

    if (other_flashes = options.delete(:flash))
      other_flashes.each do |key, value|
        flash.now[key] = value
      end
    end

    args << options
    render(*args)
  end
end
