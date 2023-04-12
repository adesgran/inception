#!/bin/bash

if [ ! -f /conf ]
then
        echo "status"
        mysqld status
        echo ""
        echo "mysqld &"
        mysqld

        touch /conf
else
        echo "MariaDB already conf"
fi

