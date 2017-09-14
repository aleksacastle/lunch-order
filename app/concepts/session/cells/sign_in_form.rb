module Session::Cell
    class SignInForm < Trailblazer::Cell
      # self.view_paths = ["../,,/../concepts/session/cells"]

      include ActionView::RecordIdentifier
      # include ActionView::Helpers::FormHelper
      include ActionView::Helpers::FormOptionsHelper
      include SimpleForm::ActionViewExtensions::FormHelper

    end
end
