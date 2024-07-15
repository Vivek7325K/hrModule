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

const ProjectView = (props) => {
  const { record, loading } = props;

  if (loading || !record) {
    return <Spinner />;
  }

  return (
    <ViewWrapper>
      <EmployeeViewItem
        label={i18n('entities.project.fields.employee')}
        value={record.employee}
      />
      <TextViewItem
        label={i18n('entities.project.fields.project')}
        value={record.project}
      />
    </ViewWrapper>
  );
};

export default ProjectView;
