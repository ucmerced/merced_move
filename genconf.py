
import jinja2

e = jinja2.Environment()

tpl = e.from_string(open('sample.tpl').read())

hosts = ['mrcd%02d'%i for i in range(1,89)] + ['mrcdg%02d'%i for i in range(1,7)]

for hostname in hosts:
    with open(f'py/py-{hostname}.sub', 'w') as f:
        f.write(tpl.render(host=hostname))
