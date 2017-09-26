require "rails_helper"

describe User do
  it { should enumerize(:role) }
  it { is_expected.to enumerize(:role) }
end
