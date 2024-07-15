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

const EmployeeView = (props) => {
  const { record, loading } = props;

  if (loading || !record) {
    return <Spinner />;
  }

  return (
    <ViewWrapper>
      <TextViewItem
        label={i18n('entities.employee.fields.firstName')}
        value={record.firstName}
      />

      <TextViewItem
        label={i18n('entities.employee.fields.lastName')}
        value={record.lastName}
      />

      <TextViewItem
        label={i18n('entities.employee.fields.title')}
        value={record.title}
      />

      <TextViewItem
        label={i18n('entities.employee.fields.email')}
        value={record.email}
      />

      <TextViewItem
        label={i18n('entities.employee.fields.phoneNumber')}
        value={record.phoneNumber}
      />
    </ViewWrapper>
  );
};

export default EmployeeView;
