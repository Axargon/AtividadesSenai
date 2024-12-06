from blockchain import Blockchain

# Inicializar a blockchain
blockchain = Blockchain()

# Adicionar blocos normais
blockchain.add_block("Transação: Alex -> Carol, valor: 100")
blockchain.add_block("Transação: Alan -> Alex, valor: 50")

# Adicionar um bloco com contrato inteligente
contract = {
    "condition": "10 > 5",  # Condição: avaliada como True
    "action": "print('Contrato executado: Transferência automática de 50 para Alex')"  # Ação
}
blockchain.add_block("Contrato Inteligente: Transferência automática", contract=contract)

# Exibir os blocos
for block in blockchain.chain:
    print(f"Index: {block.index}")
    print(f"Timestamp: {block.timestamp}")
    print(f"Data: {block.data}")
    print(f"Hash: {block.hash}")
    print(f"Previous Hash: {block.previous_hash}")
    print(f"Contract: {block.contract}")
    print("-" * 30)