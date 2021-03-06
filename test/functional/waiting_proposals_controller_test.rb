#
# Copyright 2011 National Institute of Informatics.
#
#
#    Licensed under the Apache License, Version 2.0 (the "License"); you may
#    not use this file except in compliance with the License. You may obtain
#    a copy of the License at
#
#         http://www.apache.org/licenses/LICENSE-2.0
#
#    Unless required by applicable law or agreed to in writing, software
#    distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
#    WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
#    License for the specific language governing permissions and limitations
#    under the License.
require 'test_helper'

class WaitingProposalsControllerTest < ActionController::TestCase
  # called before every single test
  def setup
    proposal = Proposal.new(:name => 'test', :software => Software.find_by_name("nova"), :state => 'init')
    @wp = WaitingProposal.new(:proposal => proposal, :operation => 'install')
    @wp.save
  end

  # called after every single test
  def teardown
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:waiting_proposals)
  end

end
