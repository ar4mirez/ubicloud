# frozen_string_literal: true

require_relative "../model"

class AccessTag < Sequel::Model
  set_primary_key :id
  many_to_one :project

  include ResourceMethods

  def before_destroy
    # XXX: Remove when dropping applied_tag table
    DB[:applied_tag].where(access_tag_id: id).delete
    super
  end
end

# Table: access_tag
# Columns:
#  id              | uuid                     |
#  project_id      | uuid                     | NOT NULL
#  hyper_tag_id    | uuid                     |
#  hyper_tag_table | text                     |
#  name            | text                     |
#  created_at      | timestamp with time zone | NOT NULL DEFAULT now()
# Indexes:
#  access_tag_project_id_hyper_tag_id_index | UNIQUE btree (project_id, hyper_tag_id)
#  access_tag_project_id_name_index         | UNIQUE btree (project_id, name)
#  access_tag_hyper_tag_id_project_id_index | btree (hyper_tag_id, project_id)
# Foreign key constraints:
#  access_tag_project_id_fkey | (project_id) REFERENCES project(id)
