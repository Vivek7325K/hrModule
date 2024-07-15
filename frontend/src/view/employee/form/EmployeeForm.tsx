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
import employeeEnumerators from 'src/modules/employee/employeeEnumerators';
import moment from 'moment';
import DatePickerFormItem from 'src/view/shared/form/items/DatePickerFormItem';
import SwitchFormItem from 'src/view/shared/form/items/SwitchFormItem';
import Storage from 'src/security/storage';
import FilesFormItem from 'src/view/shared/form/items/FilesFormItem';
import SelectFormItem from 'src/view/shared/form/items/SelectFormItem';
import CheckboxFormItem from 'src/view/shared/form/items/CheckboxFormItem';
import TextAreaFormItem from 'src/view/shared/form/items/TextAreaFormItem';

const schema = yup.object().shape({
  firstName: yupFormSchemas.string(
    i18n('entities.employee.fields.firstName'),
    {},
  ),
  lastName: yupFormSchemas.string(
    i18n('entities.employee.fields.lastName'),
    {},
  ),
  title: yupFormSchemas.string(
    i18n('entities.employee.fields.title'),
    {},
  ),
  email: yupFormSchemas.string(
    i18n('entities.employee.fields.email'),
    {},
  ),
  phoneNumber: yupFormSchemas.integer(
    i18n('entities.employee.fields.phoneNumber'),
    {},
  ),
});

const EmployeeForm = (props) => {
  const [initialValues] = useState(() => {
    const record = props.record || {};

    return {
      firstName: record.firstName,
      lastName: record.lastName,
      title: record.title,
      email: record.email,
      phoneNumber: record.phoneNumber,
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
              <InputFormItem
                name="firstName"
                label={i18n(
                  'entities.employee.fields.firstName',
                )}
              />
            </div>
            <div className="col-lg-7 col-md-8 col-12">
              <InputFormItem
                name="lastName"
                label={i18n(
                  'entities.employee.fields.lastName',
                )}
              />
            </div>
            <div className="col-lg-7 col-md-8 col-12">
              <InputFormItem
                name="title"
                label={i18n(
                  'entities.employee.fields.title',
                )}
              />
            </div>
            <div className="col-lg-7 col-md-8 col-12">
              <InputFormItem
                name="email"
                label={i18n(
                  'entities.employee.fields.email',
                )}
              />
            </div>
            <div className="col-lg-7 col-md-8 col-12">
              <InputNumberFormItem
                name="phoneNumber"
                label={i18n(
                  'entities.employee.fields.phoneNumber',
                )}
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

export default EmployeeForm;
