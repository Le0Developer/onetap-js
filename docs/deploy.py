
import os
import pathlib
import shutil
import subprocess
import tempfile


def r(*args, check_output=False, **kwargs):
    if check_output:
        return subprocess.check_output(*args, **kwargs).decode('utf-8')
    return subprocess.call(*args, **kwargs)


p = pathlib.Path(__file__).parent
g = os.getenv

missing_env = [
    x
    for x in ('GITHUB_ACTOR', 'GITHUB_TOKEN', 'GITHUB_REPOSITORY')
    if x not in os.environ 
]

if missing_env:
    print('Missing following enviroment variables: ' + ', '.join(missing_env))
    exit(1)


branches = [
    x.strip()
    for x in r(['git', 'for-each-ref', '--format=%(refname:lstrip=-1)',
                'refs/remotes/origin'], check_output=True).splitlines()
    if x.strip() not in ('HEAD', 'gh-pages')
]
commit_shas = []

# save to temporary directory, so we can keep changing branches
with tempfile.TemporaryDirectory() as tmp:
    tmp = pathlib.Path(tmp)

    for branch in branches:
        print(f'Building for branch: {branch}')
        r(['git', 'checkout', branch])
        sha = r(['git', 'rev-parse', 'HEAD'], check_output=True).strip()
        commit_shas.append(f'{branch} at {sha}')
        r(['sphinx-build', '-b', 'html', str(p), str(tmp / 'en' / branch)])

    r(['git', 'checkout', '-b', 'gh-pages'])
    shutil.copytree(tmp, '.')


print('Deploying to Github')
r(['git', 'config', '--global', 'user.name', g('GITHUB_ACTOR')])
r(['git', 'config', '--global', 'user.email', g('GITHUB_ACTOR') + '@users.noreply.github.com'])

r(
    [
        'git', 'remote', 'add', 'deploy',
        f'https://token:{g("GITHUB_TOKEN")}@'
        f'github.com/{g("GITHUB_REPOSITORY")}.git'
     ]
)

r(['git', 'add', '-A'])

changes = r(['git', 'status', '--porcelain'], check_output=True).strip()
if changes:  # only commit when there're changes
    r(
        [
            'git', 'commit', '-m',
            f'deployment of latest push to master\n\n{"".join(commit_shas)}'
        ]
    )

    r(['git', 'push', 'deploy', 'gh-pages'])
