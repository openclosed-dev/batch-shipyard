# -*- mode: python ; coding: utf-8 -*-

import os

block_cipher = None
executable_version = os.getenv('ARTIFACT_VERSION')
executable_name = f'batch-shipyard-{executable_version}-cli-win-amd64.exe'

a = Analysis(
    ['shipyard.py'],
    pathex=['batch-shipyard'],
    binaries=[],
    datas=[('federation/docker-compose.yml', 'federation'), ('heimdall', 'heimdall'), ('schemas', 'schemas'), ('scripts', 'scripts')],
    hiddenimports=[],
    hookspath=[],
    hooksconfig={},
    runtime_hooks=[],
    excludes=['future.tests', 'future.backports.test', 'future.moves.test'],
    win_no_prefer_redirects=False,
    win_private_assemblies=False,
    cipher=block_cipher,
    noarchive=False,
)
pyz = PYZ(a.pure, a.zipped_data, cipher=block_cipher)

exe = EXE(
    pyz,
    a.scripts,
    a.binaries,
    a.zipfiles,
    a.datas,
    [],
    name=executable_name,
    debug=False,
    bootloader_ignore_signals=False,
    strip=False,
    upx=True,
    upx_exclude=[],
    runtime_tmpdir=None,
    console=True,
    disable_windowed_traceback=False,
    argv_emulation=False,
    target_arch=None,
    codesign_identity=None,
    entitlements_file=None,
    version='cli_version_info.txt',
    icon=['images\\docker\\windows\\azure.ico'],
)
