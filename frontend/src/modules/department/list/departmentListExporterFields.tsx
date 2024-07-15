import { i18n } from 'src/i18n';
import exporterRenders from 'src/modules/shared/exporter/exporterRenders';

export default [
  {
    name: 'id',
    label: i18n('entities.department.fields.id'),
  },
  {
    name: 'department',
    label: i18n('entities.department.fields.department'),
    render: exporterRenders.stringArray(),
  },
  {
    name: 'employee',
    label: i18n('entities.department.fields.employee'),
    render: exporterRenders.relationToOne(),
  },
  {
    name: 'createdAt',
    label: i18n('entities.department.fields.createdAt'),
    render: exporterRenders.datetime(),
  },
  {
    name: 'updatedAt',
    label: i18n('entities.department.fields.updatedAt'),
    render: exporterRenders.datetime(),
  },
];
