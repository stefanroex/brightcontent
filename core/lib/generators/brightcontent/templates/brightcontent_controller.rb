class Brightcontent::<%= name.capitalize.pluralize %>Controller < Brightcontent::BaseController
  list_fields %w[<%= _list_fields.join " " %>]
  form_fields %w[<%= _form_fields.join " " %>]
end
