// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: Apache-2.0

import 'package:amplify_api_dart/src/graphql/factories/graphql_request_factory.dart';
import 'package:amplify_core/amplify_core.dart';

// ignore_for_file: public_member_api_docs

class ModelMutationsFactory extends ModelMutationsInterface {
  // Singleton methods/properties
  // usage: ModelQueriesFactory.instance;
  ModelMutationsFactory._();

  static final ModelMutationsFactory _instance = ModelMutationsFactory._();

  static ModelMutationsFactory get instance => _instance;

  @override
  GraphQLRequest<M> create<ModelIdentifier extends Object,
      M extends Model<ModelIdentifier, M>>(
    M model, {
    String? apiName,
    APIAuthorizationType? authorizationMode,
    Map<String, String>? headers,
  }) {
    final input = GraphQLRequestFactory.instance.buildInputVariableForMutations(
      model,
      operation: GraphQLRequestOperation.create,
    );
    // Does not use buildVariablesForMutationRequest because creations don't have conditions.
    final variables = {'input': input};

    return GraphQLRequestFactory.instance.buildRequest<ModelIdentifier, M>(
      model: model,
      variables: variables,
      modelType: model.modelType,
      requestType: GraphQLRequestType.mutation,
      requestOperation: GraphQLRequestOperation.create,
      apiName: apiName,
      authorizationMode: authorizationMode,
      headers: headers,
    );
  }

  @override
  GraphQLRequest<M> delete<ModelIdentifier extends Object,
      M extends Model<ModelIdentifier, M>>(
    M model, {
    QueryPredicate<ModelIdentifier, M>? where,
    String? apiName,
    APIAuthorizationType? authorizationMode,
    Map<String, String>? headers,
  }) {
    return deleteById(
      model.modelType,
      model.modelIdentifier,
      where: where,
      apiName: apiName,
      authorizationMode: authorizationMode,
      headers: headers,
    );
  }

  @override
  GraphQLRequest<M> deleteById<
      ModelIdentifier extends Object,
      M extends Model<ModelIdentifier, M>,
      P extends PartialModel<ModelIdentifier, M>>(
    ModelType<ModelIdentifier, M, P> modelType,
    ModelIdentifier id, {
    QueryPredicate<ModelIdentifier, M>? where,
    String? apiName,
    APIAuthorizationType? authorizationMode,
    Map<String, String>? headers,
  }) {
    final condition = GraphQLRequestFactory.instance
        .queryPredicateToGraphQLFilter(where, modelType);
    final input = {
      idFieldName: id
    }; // Simpler input than other mutations so don't use helper.
    final variables = GraphQLRequestFactory.instance
        .buildVariablesForMutationRequest(input: input, condition: condition);

    return GraphQLRequestFactory.instance.buildRequest<ModelIdentifier, M>(
      variables: variables,
      modelType: modelType,
      requestType: GraphQLRequestType.mutation,
      requestOperation: GraphQLRequestOperation.delete,
      apiName: apiName,
      authorizationMode: authorizationMode,
      headers: headers,
    );
  }

  @override
  @override
  GraphQLRequest<M> update<ModelIdentifier extends Object,
      M extends Model<ModelIdentifier, M>>(
    M model, {
    QueryPredicate<ModelIdentifier, M>? where,
    String? apiName,
    APIAuthorizationType? authorizationMode,
    Map<String, String>? headers,
  }) {
    final condition = GraphQLRequestFactory.instance
        .queryPredicateToGraphQLFilter(where, model.getInstanceType());
    final input = GraphQLRequestFactory.instance.buildInputVariableForMutations(
      model,
      operation: GraphQLRequestOperation.update,
    );

    final variables = GraphQLRequestFactory.instance
        .buildVariablesForMutationRequest(input: input, condition: condition);

    return GraphQLRequestFactory.instance.buildRequest<ModelIdentifier, M>(
      model: model,
      variables: variables,
      modelType: model.modelType,
      requestType: GraphQLRequestType.mutation,
      requestOperation: GraphQLRequestOperation.update,
      apiName: apiName,
      authorizationMode: authorizationMode,
      headers: headers,
    );
  }
}