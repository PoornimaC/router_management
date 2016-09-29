RailsAdmin.config do |config|

  config.main_app_name = ["WiFi - Router Management"]

  config.actions do
    dashboard
    index
    new
    show
    edit

    export do
      except ['Strength']
    end

    bulk_delete do
      except ['Strength']
    end

    delete do
      except ['Strength']
    end

    import do
      except ['Strength']
    end
  end

  config.configure_with(:import) do |config|
    config.logging = true
  end

end
