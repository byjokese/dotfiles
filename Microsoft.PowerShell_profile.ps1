Import-Module oh-my-posh
oh-my-posh --init --shell pwsh --config '[MASKED]\byjokese.omp.json' | Invoke-Expression

fnm env --use-on-cd | Out-String | Invoke-Expression

Invoke-Expression (& {
  $hook = if ($PSVersionTable.PSVersion.Major -lt 6) { 'prompt' } else { 'pwd' }
  (zoxide init --hook $hook powershell) -join "`n"
})
