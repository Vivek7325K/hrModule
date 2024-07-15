import schemas from 'src/modules/shared/yup/yupImporterSchemas';
import { i18n } from 'src/i18n';
import projectEnumerators from 'src/modules/project/projectEnumerators';
import moment from 'moment';

export default [
  {
    name: 'employee',
    label: i18n('entities.project.fields.employee'),
    schema: schemas.relationToMany(
      i18n('entities.project.fields.employee'),
      {},
    ),
  },
  {
    name: 'project',
    label: i18n('entities.project.fields.project'),
    schema: schemas.string(
      i18n('entities.project.fields.project'),
      {},
    ),
  },
];
