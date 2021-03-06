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
class NodeCandidatesController < ApplicationController
  def index
    respond_to do |format| 
      format.json { 
        candidates = []
        hosts = McUtils.find_hosts
        
        node_names = Node.all.map(&:name)
        hosts.each {|host|
          unless node_names.include? host["hostname"]
            candidates << {
              :name => host["hostname"], 
              :ip_address => IPSocket.getaddress(host["hostname"]), 
              :os => host["os"], 
              :os_version => host["os_version"]
            }
          end
        }
        render :json => JSON.pretty_generate(candidates.as_json)  
      }
    end
  end
end
