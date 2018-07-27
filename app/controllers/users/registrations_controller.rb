class Users::RegistrationsController < Devise::RegistrationsController
  # DELETE /resource
  def destroy
    resource.soft_delete
    Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name)
    set_flash_message :notice, :destroyed if is_flashing_format?
    yield resource if block_given?
    respond_with_navigational(resource){ redirect_to after_sign_out_path_for(resource_name) }
  end

module HashPatch
  def accumulate_values!
    accumulator = 0
    transform_values! do |val|
      val+= accumulator
      accumulator = val
    end
  end
end
Hash.include HashPatch

  
end
