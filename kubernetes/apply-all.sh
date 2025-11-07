#!/bin/bash

echo "🚀 Starting deployment of all microservices..."

for dir in */ ; do
  echo "📂 Applying all YAMLs in: $dir"

  # Check if the directory has any YAML files
  if ls "${dir}"*.yaml 1> /dev/null 2>&1; then
    kubectl apply -f "$dir"
    echo "✅ Finished applying all YAMLs in $dir"
  else
    echo "⚠️ No YAML files found in $dir, skipping..."
  fi

  echo "--------------------------------------"
done

echo "🎉 All microservices applied successfully!"

