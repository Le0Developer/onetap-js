
import os
import pathlib
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

with tempfile.TemporaryDirectory() as tmp:
    tmp = pathlib.Path(tmp)

    branches = [
        x.strip()
        for x in r(['git', 'for-each-ref', '--format=%(refname:lstrip=-1)', 
                    'refs/remotes/origin'], check_output=True).splitlines()
        if x.strip() not in ('HEAD', 'gh-pages')
    ]

    for branch in branches:
        print(f'Building for branch: {branch}')
        r(['git', 'checkout', branch])
        r(['sphinx-build', '-b', 'html', str(p), str(tmp / 'en' / branch)])

    print('Deploying to Github')
    r(['git', 'config', '--global', 'user.name', g('GITHUB_ACTOR')])
    r(['git', 'config', '--global', 'user.email', g('GITHUB_ACTOR') + '@users.noreply.github.com'])

    r(['git', 'init'], cwd=str(tmp))
    r(['git', 'remote', 'add', 'deploy', f'https://token:{g("GITHUB_TOKEN")}@github.com/{g("GITHUB_REPOSITORY")}.git'], cwd=str(tmp))
    r(['git', 'checkout', '-b', 'gh-pages'], cwd=str(tmp))

    with open(tmp / '.nojekyll', 'w') as f:
        pass

    with open(tmp / 'README.md', 'w') as f:
        f.write('This is an automatically created branch for deployment on github pages.')
    
    with open(tmp / 'index.html', 'w') as f:
        f.write('''\
<!DOCTYPE html>
<html>
   <head>
      <title>You are being redirected...</title>
      <meta http-equiv = "refresh" content="0; url='/{0}/en/master/'" />
   </head>
   <body>
      <p>Please wait while you're redirected to the <a href="/{0}/en/master/">documentation</a>.</p>
   </body>
</html>'''.format(g('GITHUB_REPOSITORY').split('/')[1]))

    r(['git', 'add', '-A'], cwd=str(tmp))
    r(['git', 'commit', '-m', f'deployment of commit {g("GITHUB_REF")}'], cwd=str(tmp))

    r(['git', 'push', 'deploy', 'gh-pages', '--force'], cwd=str(tmp))

