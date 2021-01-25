"use strict";

const ValidationContract = require("../validators/validator");
const repository = require("../repositories/product_repository");

exports.getAllProducts = async (_, response, __) => {
  try {
    let result = await repository.getAllProducts();
    response.status(200).send({
      products: result
    });
  }
  catch (error) {
    response.status(500).send({
      code: 500,
      message: "Falha na Requisição",
      error: error,
    });
  }
}

exports.getProductById = async (request, response, _) => {
  try {
    let result = await repository.getById(request.params.id)
    response.status(200).send(result);
  }
  catch (error) {
    response.status(500).send({
      code: 500,
      message: "Falha na Requisição",
      error: error,
    });
  }
    
}

exports.getProductsByTag = async (request, response, _) => {
  try {
    let result = await repository.getByTag(request.params.tag)
    response.status(200).send(result);
  }
  catch (error) {
    response.status(500).send({
      code: 500,
      message: "Falha na Requisição",
      error: error,
    });
  }
}

exports.create = async (request, response, _) => {

  let contract = new ValidationContract();
  contract.hasMinLenght(request.body.title, 3, "O titulo deve conter pelo menos 3 caracteres");
  contract.isRequired(request.body.price, "O preço deve ser enviado");
  contract.hasMinLenght(request.body.description, 3, "A descrição deve conter pelo menos 3 caracteres");

  /// Se dados inválidos
  if (!contract.isValid()) {
    response.status(400).send({
      errors: contract.errors()
    });
    return;
  }

  try {
    await repository.create(request.body);
    response.status(201).send({
      code: 201,
      message: "Produto cadastrado com sucesso",
    });
  }
  catch (error) {
    response.status(400).send({
      code: 400,
      message: "Falha ao cadastrar produto",
      error: error,
    });
  }
};

exports.update = async (request, response, _) => {
  try {
    await repository.update(request.params.id, request.body)
    response.status(200).send({
      code: 200,
      message: "Produto atualizado com sucesso",
    });
  }
  catch (error) {
    response.status(400).send({
      code: 400,
      message: "Falha ao atualizar produto",
      error: error,
    });
  }
};

exports.delete = async (request, response, _) => {
  try {
    await repository.delete(request.params.id)
    response.status(200).send({
      code: 200,
      message: "Produto removido com sucesso",
    });
  }
  catch (error) {
    response.status(400).send({
      code: 400,
      message: "Falha ao remover produto",
      error: error,
    });
  }
};