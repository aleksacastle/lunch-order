module Item::Cell
  class Show < Trailblazer::Cell
    include ActionView::RecordIdentifier
    include ActionView::Helpers::FormOptionsHelper
    include SimpleForm::ActionViewExtensions::FormHelper

    private
      property :name
      property :menu

      def menu_link
        link_to "Back", menu_path(menu)
      end
  end
end
