class ContentProviders::Home < ContentProvider

  def render_current(options)
    content_modules = ContentModule
      .where(context: options.app_context)
      .where.not(id: content_module_id)

    options.view_context.render(
      template: 'home/index',
      locals: { content_modules: content_modules }
    )
  end

  def exists?(position)
    false
  end

  def show_nav_link?
    false
  end
end