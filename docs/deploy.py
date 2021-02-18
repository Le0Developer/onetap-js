
from pathlib import Path
import os
import subprocess
import shutil
import tempfile


def r(*args, check_output=False, **kwargs):
    if check_output:
        return subprocess.check_output(*args, **kwargs).decode('utf-8')
    return subprocess.call(*args, **kwargs)


p = Path(__file__).parent
g = os.getenv


print('Building')
r(['make', 'html'], cwd='docs')

with tempfile.TemporaryDirectory() as tmp:
    tmp = Path(tmp)
    shutil.copytree('docs/_build/main/html', tmp / 'docs')
    r(['git', 'checkout', '--', '.'])  # discard changes/html
    r(['git', 'checkout', 'gh-pages'])
    r(['git', 'pull'])
    shutil.copytree(tmp / 'docs', 'docs')

print('Deploying to Github')
r(['git', 'config', '--global', 'user.name', g('GITHUB_ACTOR')])
r(['git', 'config', '--global', 'user.email', g('GITHUB_ACTOR') + '@users.noreply.github.com'])

r(['git', 'add', '-A'])

changes = r(['git', 'status', '--porcelain'], check_output=True).strip()
if changes:  # only commit when there're changes
    print('Pushing to github')
    r(
        [
            'git', 'commit', '-m',
            f'deployment of {g("GITHUB_SHA")}'
        ]
    )

    r(['git', 'push'])
