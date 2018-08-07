ActiveAdmin.register_page "Dashboard" do
menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }
  content title: proc{ I18n.t("active_admin.dashboard") } do
    # div class: "blank_slate_container", id: "dashboard_default_message" do



    columns do
      column do
        panel "Recent Catch Reports" do
          table_for Report.order("id desc").limit(10) do
            column(:date) { |report| link_to(report.date, report_path(report.user)) }
            column(:user) { |report| link_to(report.user.email, report_path(report.user)) }
            column(:location) { |report| link_to(report.location.short_name, report_path(report.location)) }
            column(:species) { |report| link_to(report.species.name, report_path(report.species.name)) }
            column(:catch) { |report| link_to(report.catch_keepers, report_path(report.species.name)) }
          end
        end
      end

       

    column do
      panel "Recent User Additions" do
        table_for User.order("id desc").limit(10).each do |_user|
          column(:email)    { |user| link_to(user.email, admin_user_path(user)) }
          column(:state_waters)    { |user| link_to(user.state_waters, admin_user_path(user)) }
          column(:state_waters)    { |user| link_to(user.home_port, admin_user_path(user)) }
        end
      end
    end #columns

    
    columns do
      panel "User Graph" do
        div do
          render("layouts/graph", model: "dashboard")
        end
      end
    end
  end # columns


     
 end
end


