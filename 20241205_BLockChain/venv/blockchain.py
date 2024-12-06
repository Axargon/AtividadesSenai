import hashlib
import time

class Block:
    def __init__(self, index, previous_hash, data, timestamp=None, contract=None):
        self.index = index
        self.previous_hash = previous_hash
        self.data = data
        self.contract = contract  # Novo: Contrato inteligente (opcional)
        self.timestamp = timestamp or time.time()
        self.hash = self.calculate_hash()

    def calculate_hash(self):
        # Concatena os dados do bloco e gera um hash SHA-256
        block_string = f"{self.index}{self.previous_hash}{self.data}{self.timestamp}{self.contract}"
        return hashlib.sha256(block_string.encode()).hexdigest()


class Blockchain:
    def __init__(self):
        self.chain = [self.create_genesis_block()]

    def create_genesis_block(self):
        return Block(0, "0", "Genesis Block")

    def get_latest_block(self):
        return self.chain[-1]

    def add_block(self, data, contract=None):  # Agora aceitamos 'contract' como parâmetro
        previous_block = self.get_latest_block()
        new_block = Block(len(self.chain), previous_block.hash, data, contract=contract)
        if self.is_block_valid(new_block, previous_block):
            self.chain.append(new_block)
            if contract:  # Processa o contrato se houver
                self.process_contract(new_block)
        else:
            print("Bloco inválido!")

    def is_block_valid(self, new_block, previous_block):
        if new_block.previous_hash != previous_block.hash:
            return False
        if new_block.index != previous_block.index + 1:
            return False
        if new_block.hash != new_block.calculate_hash():
            return False
        return True

    def is_chain_valid(self):
        for i in range(1, len(self.chain)):
            current_block = self.chain[i]
            previous_block = self.chain[i - 1]
            if not self.is_block_valid(current_block, previous_block):
                return False
        return True

    def process_contract(self, block):
        """Processa contratos inteligentes em blocos."""
        if block.contract:
            condition, action = block.contract.get("condition"), block.contract.get("action")
            # Verifique se a condição é verdadeira
            if eval(condition):  # Use apenas em ambientes seguros!
                print(f"Executando contrato: {action}")
                exec(action)  # Executa a ação
            else:
                print(f"Condição do contrato não atendida: {condition}")