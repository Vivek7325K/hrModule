import { i18n } from 'src/i18n';
import exporterRenders from 'src/modules/shared/exporter/exporterRenders';

export default [
  {
    name: 'id',
    label: i18n('entities.project.fields.id'),
  },
  {
    name: 'employee',
    label: i18n('entities.project.fields.employee'),
    render: exporterRenders.relationToMany(),
  },
  {
    name: 'project',
    label: i18n('entities.project.fields.project'),
  },
  {
    name: 'createdAt',
    label: i18n('entities.project.fields.createdAt'),
    render: exporterRenders.datetime(),
  },
  {
    name: 'updatedAt',
    label: i18n('entities.project.fields.updatedAt'),
    render: exporterRenders.datetime(),
  },
];
