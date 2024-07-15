import { i18n } from 'src/i18n';
import exporterRenders from 'src/modules/shared/exporter/exporterRenders';

export default [
  {
    name: 'id',
    label: i18n('entities.employee.fields.id'),
  },
  {
    name: 'firstName',
    label: i18n('entities.employee.fields.firstName'),
  },
  {
    name: 'lastName',
    label: i18n('entities.employee.fields.lastName'),
  },
  {
    name: 'title',
    label: i18n('entities.employee.fields.title'),
  },
  {
    name: 'email',
    label: i18n('entities.employee.fields.email'),
  },
  {
    name: 'phoneNumber',
    label: i18n('entities.employee.fields.phoneNumber'),
    render: exporterRenders.integer(),
  },
  {
    name: 'createdAt',
    label: i18n('entities.employee.fields.createdAt'),
    render: exporterRenders.datetime(),
  },
  {
    name: 'updatedAt',
    label: i18n('entities.employee.fields.updatedAt'),
    render: exporterRenders.datetime(),
  },
];
