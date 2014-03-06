class ContentProviders::ModuleCompleteProvider < ContentProvider
  def render_current(options)

    options.view_context.render(
      template: 'home/index'
    )
  end

  def exists?(position)
    false
  end

  def show_nav_link?
    false
  end
end