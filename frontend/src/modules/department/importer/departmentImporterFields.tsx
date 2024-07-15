import schemas from 'src/modules/shared/yup/yupImporterSchemas';
import { i18n } from 'src/i18n';
import departmentEnumerators from 'src/modules/department/departmentEnumerators';
import moment from 'moment';

export default [
  {
    name: 'department',
    label: i18n('entities.department.fields.department'),
    schema: schemas.stringArray(
      i18n('entities.department.fields.department'),
      {
        options: departmentEnumerators.department,
      },
    ),
  },
  {
    name: 'employee',
    label: i18n('entities.department.fields.employee'),
    schema: schemas.relationToOne(
      i18n('entities.department.fields.employee'),
      {},
    ),
  },
];
