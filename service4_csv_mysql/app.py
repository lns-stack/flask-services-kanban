from flask import Flask, request, jsonify
import pandas as pd
import mysql.connector
from dotenv import load_dotenv
import os
import io

load_dotenv()

app = Flask(__name__)

COLONNES_REQUISES = {'nom_serie', 'valeur'}
COLONNES_VALIDES  = {'nom_serie', 'valeur', 'categorie', 'date_mesure'}
TAILLE_MAX_OCTETS = 5 * 1024 * 1024  # 5 Mo


def get_connection():
    return mysql.connector.connect(
        host=os.getenv('DB_HOST', 'localhost'),
        port=int(os.getenv('DB_PORT', 3306)),
        user=os.getenv('DB_USER'),
        password=os.getenv('DB_PASSWORD'),
        database=os.getenv('DB_NAME')
    )


if __name__ == '__main__':
    app.run(debug=True, port=5004)
