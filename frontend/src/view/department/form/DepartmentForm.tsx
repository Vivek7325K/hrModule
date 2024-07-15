import { useForm, FormProvider } from 'react-hook-form';
import React, { useState } from 'react';
import { i18n } from 'src/i18n';
import FormWrapper from 'src/view/shared/styles/FormWrapper';
import * as yup from 'yup';
import yupFormSchemas from 'src/modules/shared/yup/yupFormSchemas';
import { yupResolver } from '@hookform/resolvers/yup';
import ButtonIcon from 'src/view/shared/ButtonIcon';
import InputFormItem from 'src/view/shared/form/items/InputFormItem';
import InputNumberFormItem from 'src/view/shared/form/items/InputNumberFormItem';
import ImagesFormItem from 'src/view/shared/form/items/ImagesFormItem';
import RadioFormItem from 'src/view/shared/form/items/RadioFormItem';
import departmentEnumerators from 'src/modules/department/departmentEnumerators';
import moment from 'moment';
import EmployeeAutocompleteFormItem from 'src/view/employee/autocomplete/EmployeeAutocompleteFormItem';
import DatePickerFormItem from 'src/view/shared/form/items/DatePickerFormItem';
import SwitchFormItem from 'src/view/shared/form/items/SwitchFormItem';
import Storage from 'src/security/storage';
import FilesFormItem from 'src/view/shared/form/items/FilesFormItem';
import SelectFormItem from 'src/view/shared/form/items/SelectFormItem';
import CheckboxFormItem from 'src/view/shared/form/items/CheckboxFormItem';
import TextAreaFormItem from 'src/view/shared/form/items/TextAreaFormItem';

const schema = yup.object().shape({
  department: yupFormSchemas.stringArray(
    i18n('entities.department.fields.department'),
    {
      options: departmentEnumerators.department,
    },
  ),
  employee: yupFormSchemas.relationToOne(
    i18n('entities.department.fields.employee'),
    {},
  ),
});

const DepartmentForm = (props) => {
  const [initialValues] = useState(() => {
    const record = props.record || {};

    return {
      department: record.department || [],
      employee: record.employee,
    };
  });

  const form = useForm({
    resolver: yupResolver(schema),
    mode: 'all',
    defaultValues: initialValues as any,
  });

  const onReset = () => {
    Object.keys(initialValues).forEach((key) => {
      form.setValue(key, initialValues[key]);
    });
  };

  const onSubmit = (values) => {
    props.onSubmit(props?.record?.id, values);
  };

  return (
    <FormWrapper>
      <FormProvider {...form}>
        <form onSubmit={form.handleSubmit(onSubmit)}>
          <div className="row">
            <div className="col-lg-7 col-md-8 col-12">
              <SelectFormItem
                name="department"
                label={i18n(
                  'entities.department.fields.department',
                )}
                options={departmentEnumerators.department.map(
                  (value) => ({
                    value,
                    label: i18n(
                      `entities.department.enumerators.department.${value}`,
                    ),
                  }),
                )}
                mode="multiple"
              />
            </div>
            <div className="col-lg-7 col-md-8 col-12">
              <EmployeeAutocompleteFormItem
                name="employee"
                label={i18n(
                  'entities.department.fields.employee',
                )}
                showCreate={!props.modal}
              />
            </div>
          </div>
          <div className="form-buttons">
            <button
              className="btn btn-primary"
              disabled={props.saveLoading}
              type="button"
              onClick={form.handleSubmit(onSubmit)}
            >
              <ButtonIcon
                loading={props.saveLoading}
                iconClass="far fa-save"
              />{' '}
              {i18n('common.save')}
            </button>

            <button
              className="btn btn-light"
              type="button"
              disabled={props.saveLoading}
              onClick={onReset}
            >
              <i className="fas fa-undo"></i>{' '}
              {i18n('common.reset')}
            </button>

            {props.onCancel ? (
              <button
                className="btn btn-light"
                type="button"
                disabled={props.saveLoading}
                onClick={() => props.onCancel()}
              >
                <i className="fas fa-times"></i>{' '}
                {i18n('common.cancel')}
              </button>
            ) : null}
          </div>
        </form>
      </FormProvider>
    </FormWrapper>
  );
};

export default DepartmentForm;
