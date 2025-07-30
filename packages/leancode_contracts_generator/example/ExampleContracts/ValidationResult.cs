using System;
using System.Collections.Generic;
using LeanCode.Contracts;

namespace LeanCode.ContractsGeneratorV2.ExampleContracts
{
  public class ValidateImportActivityTranslationsResult
  {
    public ValidationResult<Guid> ActivityDoesNotExist { get; set; }
  }

  public class ValidationResult<TElement>
  {
    public bool IsInvalid { get; set; }
    public List<TElement> Elements { get; set; }
  }
}