#
# Cookbook Name:: pris
# Resource:: mapper
#
# Copyright (c) 2015 ConvergeOne Holdings Corp.
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

actions :create, :delete, :create_if_missing

default_action :create

attribute :name, :kind_of => String, :name_attribute => true
attribute :resource_name, :kind_of => String, :required => true
attribute :type, :kind_of => String, :equal_to => ['echo', 'null',
  'ocs.computers', 'ocs.devices', 'script'], :default => 'echo'
# key / value string pairs that vary by type and are often required.
# See PRIS documentation.
attribute :params, :kind_of => Hash, :default => {}

attr_accessor :exists, :resource_exists, :changed
