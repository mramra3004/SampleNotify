﻿using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using System.Threading.Tasks;
using Shared.Dto;

namespace Shared.EF.Interfaces
{
    public interface IRepository<T>
    {
        Task<QueryResult<T>> QueryAsync(Expression<Func<T, bool>> predicate, int pageIndex, int pageSize, string sort);
        Task<IList<T>> GetManyAsync(Expression<Func<T, bool>> predicate);

        Task<IList<TType>> GetAsync<TType>(Expression<Func<T, bool>> predicate, Expression<Func<T, TType>> select)
            where TType : class;

        Task<IList<TType>> GetAsync<TType>(Expression<Func<T, TType>> select)
            where TType : class;

        Task<IList<T>> GetAllAsync();
        Task<T> GetSingleAsync(Expression<Func<T, bool>> predicate);
        Task<T> GetByIdAsync(Guid entityId);
        Task<T> GetByIdAsync<TKey>(TKey entityId);
        Task<bool> ExistsAsync(Expression<Func<T, bool>> predicate);
        T Add(T entity);
        void AddRange(IEnumerable<T> entities);
        void Update(T entity);
        void Delete<TKey>(TKey entityId);
        void Delete(T entity);
        void DeleteMany(IEnumerable<T> entities);
        Task<int> CountAllAsync();
        Task<int> CountAsync(Expression<Func<T, bool>> predicate);
    }
}