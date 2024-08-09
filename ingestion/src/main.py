from dotenv import load_dotenv
import os
from pathlib import Path

# Get the root directory
root_dir = Path(__file__).resolve().parent.parent.parent

# Load the .env file from the root directory
load_dotenv(dotenv_path=root_dir / '.env')

# Now you can access your environment variables
db_host = os.getenv('DB_HOST')
db_user = os.getenv('DB_USER')
# ... and so on