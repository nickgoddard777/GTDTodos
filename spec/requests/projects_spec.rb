require 'spec_helper'

describe "Projects" do
  describe "GET /projects" do
    describe 'failure' do

      it 'should not make a new project' do
        lambda do
          visit new_project_path
          fill_in "Title",      :with => ""
          fill_in "Status",     :with => ""
          fill_in "Outcome",    :with => ""
          click_button
          response.should render_template('projects/new')
          response.should have_selector("div#error_explanation")
        end.should_not change(Project, :count)
      end
    end

    describe 'success' do

      it 'should make a new user' do
        lambda do
          visit new_project_path
          fill_in "Title",      :with => "Example Project"
          fill_in "Status",     :with => "live"
          fill_in "Outcome",    :with => "Example description"
          click_button
          response.should have_selector("div.flash.success", :content => "created")
          response.should render_template('projects/show')
        end.should change(Project, :count).by(1)
      end
    end
  end
end

