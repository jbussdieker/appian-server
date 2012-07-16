module ProjectsHelper
  def build_status_badge(project)
    color = project.build_info["color"]
    if color == "grey"
      concat(tag(:i, class: "badge"))
    end
    if color == "red"
      concat(tag(:i, class: "badge badge-important"))
    end
    if color == "blue"
      concat(tag(:i, class: "badge badge-success"))
    end

    return
  end
end
