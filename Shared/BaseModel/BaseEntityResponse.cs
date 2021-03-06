﻿using System.Collections.Generic;

namespace Shared.BaseModel
{
    public class BaseEntityResponse<TEntity> : BaseResponse
    {
        public BaseEntityResponse(bool status, IList<DetailError> detailErrors) : base(status, detailErrors)
        {
        }

        public TEntity Data { get; set; }

        public virtual BaseEntityResponse<TEntity> SetData(TEntity data)
        {
            Data = data;
            return this;
        }
    }
}