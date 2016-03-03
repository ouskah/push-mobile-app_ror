# Use this setup block to configure all options available in SimpleForm

SimpleForm.setup do |config|
    config.wrappers :bootstrap3, tag: "div", class: "form-group", error_class: "form-error" do |b|
        b.use :html5
        b.use :placeholder
        b.use :label
        b.use :input
        b.use :error, wrap_with: {tag: "span", class: "help-error"}
        b.use :hint, wrap_with: {tag: "p", class: "help-block"}
    end
    
    config.wrappers :checkbox, tag: "div", class: "form-group checkbox", error_class: "form-error" do |b|
        b.use :html5
        b.use :placeholder
        b.use :label
        b.use :input
        b.use :error, wrap_with: {tag: "span", class: "help-error"}
        b.use :hint, wrap_with: {tag: "p", class: "help-block"}
    end
    
    config.wrappers :prepend, tag: "div", class: "control-group", error_class: "form-error" do |b|
        b.use :html5
        b.use :placeholder
        b.use :label
        b.wrapper tag: "div", class: "controls" do |input|
            input.wrapper tag: "div", class: "input-append" do |append|
                append.use :input
            end
            input.use :hint, wrap_with: {tag: "span", class: "help-block"}
            input.use :error, wrap_with: {tag: "span", class: "help-block"}
        end
    end
    
    
    # Wrappers for forms and inputs using the Twitter Bootstrap toolkit
    config.button_class = "btn btn-primary"
    config.error_notification_class = "alert alert-danger"
    config.label_class = "control-label"
    config.input_class = "form-control"
    config.boolean_style = :inline
    config.default_wrapper = :bootstrap3
end