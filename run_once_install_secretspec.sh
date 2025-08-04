#!/bin/bash
set -e

echo "🔐 Installing SecretSpec CLI..."

# Installs the latest release from secretspec.dev
curl -sSL https://install.secretspec.dev | sh

echo "✅ SecretSpec installed successfully."

