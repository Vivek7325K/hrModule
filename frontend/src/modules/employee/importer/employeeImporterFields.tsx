import schemas from 'src/modules/shared/yup/yupImporterSchemas';
import { i18n } from 'src/i18n';
import employeeEnumerators from 'src/modules/employee/employeeEnumerators';
import moment from 'moment';

export default [
  {
    name: 'firstName',
    label: i18n('entities.employee.fields.firstName'),
    schema: schemas.string(
      i18n('entities.employee.fields.firstName'),
      {},
    ),
  },
  {
    name: 'lastName',
    label: i18n('entities.employee.fields.lastName'),
    schema: schemas.string(
      i18n('entities.employee.fields.lastName'),
      {},
    ),
  },
  {
    name: 'title',
    label: i18n('entities.employee.fields.title'),
    schema: schemas.string(
      i18n('entities.employee.fields.title'),
      {},
    ),
  },
  {
    name: 'email',
    label: i18n('entities.employee.fields.email'),
    schema: schemas.string(
      i18n('entities.employee.fields.email'),
      {},
    ),
  },
  {
    name: 'phoneNumber',
    label: i18n('entities.employee.fields.phoneNumber'),
    schema: schemas.integer(
      i18n('entities.employee.fields.phoneNumber'),
      {},
    ),
  },
];
