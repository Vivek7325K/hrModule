import React from 'react';
import Spinner from 'src/view/shared/Spinner';
import { i18n } from 'src/i18n';
import UserViewItem from 'src/view/user/view/UserViewItem';
import moment from 'moment';
import ViewWrapper from 'src/view/shared/styles/ViewWrapper';
import FilesViewItem from 'src/view/shared/view/FilesViewItem';
import ImagesViewItem from 'src/view/shared/view/ImagesViewItem';
import TextViewItem from 'src/view/shared/view/TextViewItem';
import CustomViewItem from 'src/view/shared/view/CustomViewItem';

import EmployeeViewItem from 'src/view/employee/view/EmployeeViewItem';

const DepartmentView = (props) => {
  const { record, loading } = props;

  if (loading || !record) {
    return <Spinner />;
  }

  return (
    <ViewWrapper>
      <CustomViewItem
        label={i18n(
          'entities.department.fields.department',
        )}
        value={record.department}
        render={(values) =>
          (values || []).map((value) => (
            <div key={value}>
              <span>
                {value
                  ? i18n(
                      `entities.department.enumerators.department.${value}`,
                    )
                  : null}
              </span>
            </div>
          ))
        }
      />

      <EmployeeViewItem
        label={i18n('entities.department.fields.employee')}
        value={record.employee}
      />
    </ViewWrapper>
  );
};

export default DepartmentView;
