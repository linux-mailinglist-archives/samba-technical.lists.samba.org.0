Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DA09D248459
	for <lists+samba-technical@lfdr.de>; Tue, 18 Aug 2020 14:03:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=M+vZtYovXCC3ew/dk7Y27CLJWOATLFemcmsWesYxK1Q=; b=hOBAirETNROEtL25nkewXZcnnt
	VJmCwxeMknvfdk3GrBQ1zf1jA0ABGzqWOeWfEKtWmKuvz2PRI02maTzlc3c745RnHsm/INZ90HeYX
	oh8KpknRp+U8dKLhONswOC3rdjt42tG5Z2V9HNll5JWQa9ru6bd6uHrvtbDVu/2c0Whjg7WolAfsK
	Jsp0lcU70ZRkcm8mIw+xdKxMIITZ5nScI5IPsuV4l2v6AIkP3oWd0EGeiey7oMarSdbMQ/mVCQzCG
	BtEp3ZU9slxOiSLxYHvJB1sZwxDr+nV/9pIuX0Dx7qOXweSx5EYIuyQd9J/JSICqUyCkxd0d964te
	nuEN/tEw==;
Received: from localhost ([::1]:49060 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1k80Jp-00ECsH-Vv; Tue, 18 Aug 2020 12:02:22 +0000
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:21706
 helo=us-smtp-1.mimecast.com) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1k80Jk-00ECsA-LL
 for samba-technical@lists.samba.org; Tue, 18 Aug 2020 12:02:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597752127;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type;
 bh=M+vZtYovXCC3ew/dk7Y27CLJWOATLFemcmsWesYxK1Q=;
 b=ZU5J7M/Y6bvxrSuRLa6zIqPFhq9UXh0ATkr8908EV7NK0YuuNovlnkRXVqpXiwJ44Pvyw0
 piwvHKr0yk0tFobKR8vCgdUUelQSmRgZxOKvpQVSUbN5pXNw/E3XK+9ihXe5tkzIWK+4Vz
 ZOvIkl5Zkc1hG3Qm5sMOkxCe9z8AGhE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597752127;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type;
 bh=M+vZtYovXCC3ew/dk7Y27CLJWOATLFemcmsWesYxK1Q=;
 b=ZU5J7M/Y6bvxrSuRLa6zIqPFhq9UXh0ATkr8908EV7NK0YuuNovlnkRXVqpXiwJ44Pvyw0
 piwvHKr0yk0tFobKR8vCgdUUelQSmRgZxOKvpQVSUbN5pXNw/E3XK+9ihXe5tkzIWK+4Vz
 ZOvIkl5Zkc1hG3Qm5sMOkxCe9z8AGhE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-487-C8xN_sQWPZinCHUYvxNGqw-1; Tue, 18 Aug 2020 07:46:12 -0400
X-MC-Unique: C8xN_sQWPZinCHUYvxNGqw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 27ADF1084C85
 for <samba-technical@lists.samba.org>; Tue, 18 Aug 2020 11:46:11 +0000 (UTC)
Received: from pbrezina.my (unknown [10.40.195.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BC4CC7A1F6
 for <samba-technical@lists.samba.org>; Tue, 18 Aug 2020 11:46:10 +0000 (UTC)
To: samba-technical@lists.samba.org
Subject: tevent: fd events do not work correctly for UDP socket?
Message-ID: <6c7d3f9b-240b-c022-2672-7dd493922050@redhat.com>
Date: Tue, 18 Aug 2020 13:46:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbrezina@redhat.com
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="------------ACDD1700FD5BEA4E1C458B0D"
X-Warn: EHLO/HELO not verified: Remote host 207.211.31.120
 (us-smtp-delivery-1.mimecast.com) incorrectly presented itself as
 us-smtp-1.mimecast.com
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Discussions on Samba internals. For general questions please
 subscribe to the list samba@lists.samba.org"
 <samba-technical.lists.samba.org>
List-Unsubscribe: <https://lists.samba.org/mailman/options/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/samba-technical/>
List-Post: <mailto:samba-technical@lists.samba.org>
List-Help: <mailto:samba-technical-request@lists.samba.org?subject=help>
List-Subscribe: <https://lists.samba.org/mailman/listinfo/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=subscribe>
From: =?utf-8?q?Pavel_B=C5=99ezina_via_samba-technical?=
 <samba-technical@lists.samba.org>
Reply-To: =?UTF-8?Q?Pavel_B=c5=99ezina?= <pbrezina@redhat.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is a multi-part message in MIME format.
--------------ACDD1700FD5BEA4E1C458B0D
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

When I connect to a port over UDP and nobody listens on the port tevent 
fires immediately read fd event even though there is no data available.

Simple reproducer is attached. Just run 'make && ./client' and see that 
read_handler is executed immediately. When there is a process listening 
(nc -ul 3333) the handler is fired only when data is available.

This probably boils down to epoll_wait but not being an epoll export, 
I'd like to ask if there is something that can be done about it or if it 
is an expected behavior.


--------------ACDD1700FD5BEA4E1C458B0D
Content-Type: text/x-csrc; charset=UTF-8;
 name="main.c"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="main.c"

#include <errno.h>
#include <stdio.h>
#include <string.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <unistd.h>
#include <arpa/inet.h>
#include <tevent.h>

int init_client(int *_fd)
{
    struct sockaddr_in addr;
    int ret;
    int fd;

    fd = socket(AF_INET, SOCK_DGRAM, 0);
    if (fd == -1) {
        fprintf(stderr, "Unable to create socket\n");
        return EIO;
    }

    addr.sin_family = AF_INET;
    addr.sin_port = htons(3333);
    addr.sin_addr.s_addr = inet_addr("127.0.0.1");

    ret = connect(fd, (struct sockaddr *)&addr, sizeof(struct sockaddr_in));
    if (ret != 0) {
        ret = errno;
        fprintf(stderr, "Unable to connect to localhost:389 [%d]: %s\n",
                ret, strerror(ret));
        return ret;
    }

    *_fd = fd;

    return 0;
}

void read_handler(struct tevent_context *ev, struct tevent_fd *fde,
                  uint16_t flags, void *pvt)
{
    int fd = *(int*)pvt;
    char buf[255] = {0};

    puts("File descriptor is readable!");
    read(fd, &buf, 254);
    printf("Data read: %s\n", buf);
}

int main()
{
    struct tevent_context *ev;
    struct tevent_fd *fde;
    char buf[255] = {0};
    int ret;
    int fd;

    ev = tevent_context_init(NULL);
    if (ev == NULL) {
        puts("Unable to create tevent context.");
        return 1;
    }

    ret = init_client(&fd);
    if (ret != 0) {
        return 1;
    }

    fde = tevent_add_fd(ev, NULL, fd, TEVENT_FD_READ, read_handler, &fd);
    if (fde == NULL) {
        puts("Unable to create fde.");
        return 1;
    }

    const char *msg = "I AM CONNECTED\n";
    write(fd, msg, strlen(msg));

    while (true) {
        tevent_loop_wait(ev);
    }
}
--------------ACDD1700FD5BEA4E1C458B0D
Content-Type: text/plain; charset=UTF-8;
 name="Makefile"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="Makefile"

YWxsOiBjbGllbnQKCmNsaWVudDogLi9tYWluLmMKCWdjYyAtZ2dkYjMgLW8gY2xpZW50IC4vbWFp
bi5jIC1sdGFsbG9jIC1sdGV2ZW50CgpjbGVhbjoKCXJtIC1mIGNsaWVudAo=
--------------ACDD1700FD5BEA4E1C458B0D--


