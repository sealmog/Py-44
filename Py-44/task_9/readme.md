## Описание утилиты

### Установка пакетов для работы с Google Drive

```bash
python3 -m venv env
source env/bin/activate
pip install google-cloud-storage
```

### Примеры использования

```bash
python3.9 task_9.py -c Yandex -vk VK_TOKEN -yd YANDEX_TOKEN -r
```
or
```bash
python3.9 task_9.py -c Google -vk VK_TOKEN -gd GOOGLE_SA_FILE -n 4
```

### Ключи командной строки

```commandline
'-c', '--cloud'     - Cloud Storage: Yandex or Google, required=True
'-n', '--number'    - Number of files for upload, optional, default=5
'-r', '--replace'   - Use replace to override photos, optional
'-vk', '--vk_token' - VK token, required=True
'-yd', '--yd_token' - Yandex Disk token
'-gd', '--gd_file'  - Google Drive Service Account file
```

[Создание сервисного аккаунта Google Cloud](http://datalytics.ru/all/rabotaem-s-api-google-drive-s-pomoschyu-python)
