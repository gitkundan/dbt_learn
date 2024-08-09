#!/bin/bash
python_version=$(python --version | awk '{print $2}' | cut -d'.' -f1-2)
if [ "$python_version" != "3.10" ]; then
	    echo "Error: Python version must be 3.10. Current version is $python_version"
	        exit 1
fi

# install vscode extensions
defined_extensions=("ext.ruff" "ext.pyline")

for extension in "${defined_extensions[@]}"; do
    echo "Installing $extension extension..."
    code --install-extension "$extension"
    if [ $? -eq 0 ]; then
        echo "$extension extension installed successfully."
    elif [ $? -eq 1 ]; then
        echo "$extension extension is already installed."
    else
        echo "Error: Failed to install the $extension extension."
        exit 1
    fi
done

echo "All extensions installed or already installed successfully!"

git clone https://example.git
cd example
python -m venv .venv
source .venv/scripts/activate
pip install poetry dbt
pip install dbt-core
# start here on installing dbt and how to use it 
code .
echo "Project setup and documentation generation complete!"
