require "rails_helper"

describe User do
  it { is_expected.to enumerize(:role) }
end
