module InventoryItemsHelper
  def inventory_groups_options_array
    user_default_branch.inventory_groups.all.map{|m| [m.name, m.id]}
  end

  def inventory_unit_of_measurements_options_array
    user_default_branch.inventory_unit_of_measurements.all.map{|m| [m.unit_name, m.id]}
  end
end
