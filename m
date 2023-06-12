Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4216972BE57
	for <lists+samba-technical@lfdr.de>; Mon, 12 Jun 2023 12:07:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=2+yavycSoA0mbpSnpd/uuwzqV110DtqI4MvYOMbCqgA=; b=GoxZOpwAaorjCYAICHvPNpbQCq
	kSr4AUVjkNJa4sQuSbnp2B0kEALbw3iX+SXIKUrkZ9QZ9W38PefvnvpOMk7/b/vJ9EEU+SspX/fWL
	zwIslDXBhBBqut6sgZdJbhSDwvenevVCt6+Wk6q3p6GfVvOkJAnBRMJ1e41cNWGUQOuwBLmz15/HR
	01X9AiM4H/3L8l37RXAHmd2OkrGTVCjqqvSC0wDUvinvpwjcU3Da440uqA1nXwkG70WvCDY4/aPAl
	kxU3cWjrsnMXHovmEJy47LxI461NDZGmy6iUebGt8WUiUB59kx1dd/AF0BeRB4Od2ESW1pIjcVmKd
	AUSeBoug==;
Received: from ip6-localhost ([::1]:60414 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1q8eRx-001PZ4-TF; Mon, 12 Jun 2023 10:07:02 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:55747) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1q8eRr-001PYv-Hv
 for samba-technical@lists.samba.org; Mon, 12 Jun 2023 10:06:59 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 4306EC17C
 for <samba-technical@lists.samba.org>; Mon, 12 Jun 2023 13:06:51 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 943F4B7AB
 for <samba-technical@lists.samba.org>; Mon, 12 Jun 2023 13:06:50 +0300 (MSK)
Message-ID: <ee8d1fe9-f7e0-a629-715f-5e859af8fcbc@tls.msk.ru>
Date: Mon, 12 Jun 2023 13:06:50 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: samba-technical <samba-technical@lists.samba.org>
Subject: atomic ops in heimdal: -latomic
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
From: Michael Tokarev via samba-technical <samba-technical@lists.samba.org>
Reply-To: Michael Tokarev <mjt@tls.msk.ru>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi!

Something changed - probably in Debian (where I build packages), and some stuff
started failing, eg

https://buildd.debian.org/status/fetch.php?pkg=samba&arch=armel&ver=2%3A4.18.3%2Bdfsg-1&stamp=1686556171&raw=0

/usr/bin/ld: third_party/heimdal/lib/krb5/krcache.c.55.o: in function `krcc_get_principal':
./bin/default/../../third_party/heimdal/lib/krb5/krcache.c:1395: undefined reference to `__atomic_load_8'
/usr/bin/ld: ./bin/default/../../third_party/heimdal/lib/krb5/krcache.c:1395: undefined reference to `__atomic_store_8'
/usr/bin/ld: third_party/heimdal/lib/krb5/krcache.c.55.o: in function `krcc_remove_cred':
./bin/default/../../third_party/heimdal/lib/krb5/krcache.c:1447: undefined reference to `__atomic_load_8'
/usr/bin/ld: ./bin/default/../../third_party/heimdal/lib/krb5/krcache.c:1447: undefined reference to `__atomic_store_8'
/usr/bin/ld: third_party/heimdal/lib/krb5/krcache.c.55.o: in function `initialize_internal':
./bin/default/../../third_party/heimdal/lib/krb5/krcache.c:873: undefined reference to `__atomic_load_8'
/usr/bin/ld: ./bin/default/../../third_party/heimdal/lib/krb5/krcache.c:873: undefined reference to `__atomic_store_8'
/usr/bin/ld: ./bin/default/../../third_party/heimdal/lib/krb5/krcache.c:919: undefined reference to `__atomic_load_8'
/usr/bin/ld: ./bin/default/../../third_party/heimdal/lib/krb5/krcache.c:919: undefined reference to `__atomic_store_8'
collect2: error: ld returned 1 exit status

Apparently this now needs -latomic on the link line. I don't know yet why it ended up like this,
but other projects which faced this same issue, just added -latomic in similar cases.

FWIW.

Thanks,

/mjt

