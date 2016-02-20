ActiveAdmin.register Department do


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end
  permit_params :name, :id

  form do |f|
    f.inputs "Department Details" do
      f.input :name
      f.input :id, as: :hidden, :value => Department.find_by_id(params[:id])
    end
    f.actions
  end

end