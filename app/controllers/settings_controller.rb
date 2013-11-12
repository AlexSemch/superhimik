class SettingsController < ApplicationController

	def edit
		@setting = Setting.first #where(system_name: I18n.t(:superhimik))
	end

	def update
		@setting = Setting.first #where(system_name: I18n.t(:superhimik))
	    if @setting.update_attributes(setting_params)
	      flash[:success] = t(:settings_updated)
	      redirect_to settings_path
	    else
	      render 'edit'
	    end		
	end

	private

	    def setting_params
	      params.require(:setting).permit(:system_name, :nav_year, :footer, :about_as, :contact_as)
	    end
end