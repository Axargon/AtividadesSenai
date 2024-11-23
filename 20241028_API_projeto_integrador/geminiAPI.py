from sqlalchemy import create_engine, text
from dotenv import load_dotenv
import google.generativeai as generai
import os

host = 'localhost'
port = '3306'
user = 'root'
password = 'senai%40134'
database = 'bd_medidor'

# Create the engine
engine = create_engine(f"mysql+mysqlconnector://{user}:{password}@{host}:{port}/{database}")

def query_database(query):
    with engine.connect() as conn:
        result = conn.execute(text(query))  # Wrap the query in text()
        return result.fetchall()
    
load_dotenv()  # Carrega as variáveis do arquivo .env
api_key = os.getenv('GOOGLE_API_KEY')
generai.configure(api_key=api_key)
model = generai.GenerativeModel(model_name="gemini-1.5-pro")


def generate_sql_query(prompt):
    schema = {
         "columns": ["id", "temperatura", "pressao", "altitude","umidade","co2","poeria", "tempo_registro"],
         "types": ["INT", "DECIMAL", "DECIMAL","DECIMAL","DECIMAL","DECIMAL","DECIMAL", "DATETIME"]
        }
    response = model.generate_content(
            f"SQL only: {prompt} from the 'tb_registro' table, which has columns {schema['columns']} with types {schema['types']}."
    )
    return response.text


resposta = generate_sql_query("Encontre os valores medios de de temperatura por dia.")

print(resposta)

