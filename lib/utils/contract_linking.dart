import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:metabox/utils/constants.dart';
import 'package:web3dart/web3dart.dart';

Future<DeployedContract> loadContract() async {
  String abi = await rootBundle.loadString('assets/abi.json');
  String contractAddress = contractAddress1;
  final contract = DeployedContract(ContractAbi.fromJson(abi, "naezy"),
      EthereumAddress.fromHex(contractAddress));

  return contract;
}

Future<String> callFunction(String funcName, List<dynamic> args,
    Web3Client ethClient, String privateKey) async {
  EthPrivateKey credentials = EthPrivateKey.fromHex(privateKey);
  DeployedContract contract = await loadContract();
  final ethfunction = contract.function(funcName);
  final result = await ethClient.sendTransaction(
      credentials,
      Transaction.callContract(
          contract: contract, function: ethfunction, parameters: args),
      chainId: null,
      fetchChainIdFromNetworkId: true);

  return result;
}

Future<String> mintNFT(
    Web3Client ethClient, EthereumAddress address, String uri) async {
  var response =
      await callFunction('mint', [address, uri], ethClient, ownerPrivateKey);

  print('NFT MINTED');

  return response;
}

Future<List<dynamic>> ask(
    String funcName, List<dynamic> args, Web3Client ethClient) async {
  final contract = await loadContract();
  final ethfunction = contract.function(funcName);
  final result = await ethClient.call(
      contract: contract, function: ethfunction, params: args);

  return result;
}
