Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 184701D390F
	for <lists+samba-technical@lfdr.de>; Thu, 14 May 2020 20:23:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=1+uCZHZY9myCrK4/M5o+3Y6VP8oHrC3Q44ScTNt9gDI=; b=NpNDSAt/SeNCrfhvHdBWeMymHs
	Mq4SCzfxhLLub2uwjq5t/7aZuvjuShmBnuhPwyrPM3wtWmIH4L+uHpKJvV89s6Fl22ZTYZUfrdWvq
	3sHxWPWL40JPET17JAtTJvl8ja3QYIzlg4Wcntpj0snbQD2td2wwA3t4TtKPgOAME5q3qX/DceIPZ
	f2TQYFSvjQU4QwC8riQUiADTjP9lvFy6cPa/TVY7yWBd9bbwlNKWSM3XnSZZ1DZF57j4xzr77A2c2
	YpIIsIjoK71xo/j/obvJaBdu8HzAiNvd1+vdA25ml9G7oN/RSsfWKGmucmEKGrIGkKu1Kz1ZtCTG3
	EPYun9OA==;
Received: from localhost ([::1]:33712 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jZIVM-004MOP-Gk; Thu, 14 May 2020 18:22:48 +0000
Received: from [81.174.151.90] (port=50018 helo=mail.gunas.co.uk) 
 by hr1.samba.org with esmtp (Exim) id 1jZIVE-004MOI-3S
 for samba-technical@lists.samba.org; Thu, 14 May 2020 18:22:45 +0000
Received: from [192.168.1.101] (alibythesea.plus.com [81.174.151.90])
 by mail.gunas.co.uk (Postfix) with ESMTPSA id CC24E5403A3
 for <samba-technical@lists.samba.org>; Thu, 14 May 2020 18:57:38 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gunas.co.uk; s=mail;
 t=1589479058; bh=2iEchnIGVphJ97QpLAp+LmQ1sZbAVApsJImKQOui4JQ=;
 h=To:From:Subject:Date:From;
 b=o/aVw8VMAuvb0l5hXQ2QlACBftNf4HLpzTP2+ifB6KvOAVovxw6DACrSmTNfg1jqH
 JIJnTSQMinGFDuaWYXWldNP/+0eMINMyLIUpoRHN7sI1MXsVutkK0NxcbBwalTNqTr
 1wwkehHHwZ9niXiPsBGEw7rz+fZ1w+CHQV65iMzxU+GMijaKBfB7IL3kv9eFpM5CWL
 U2ey2Dz0NdG7I5oqIX9+P1b+1q3imdi2raAWHjc36RUbqzzwqQDIqN+VFLIGqV8B0/
 un/rd7t9hZUX9tY12VTKIrqwV/laCKCdCGM8Uy+NR2BAENtoabQHvt1524laSRFJVQ
 foDXy4k4nqRbQ==
To: samba-technical@lists.samba.org
Subject: Re: DNS problem ubuntu server 20.04
Message-ID: <bf44e5c1-f6ed-889e-50cf-f90395136912@gunas.co.uk>
Date: Thu, 14 May 2020 18:57:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
From: RickJC1 via samba-technical <samba-technical@lists.samba.org>
Reply-To: RickJC1 <rickjc2@gunas.co.uk>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hello everyone I am trying to get Samba 4.11.6 -Ubuntu Bind 
9.16.1-Ubuntu to work with Ubuntu server 20.04


Hostname: dc1s

NetBIOS Domain: GUNAS

DNS Domain: gunas.int


I am trying resolve a problem with not being able to find the server. 
After many days of failed attempts. I did not want to bother anyone but 
I have been defeated so I could do with some help please.


*/etc/resolv.conf*

nameserver 127.0.0.53

options edns0

search gunas.int


*/etc/systemd/network/enp0s3.network*

[Match]

Name=enp0s3


[Network]

DNS=192.168.1.123

DNSSECNegativeTrustAnchors=lan

Domains=lan


If I do *host -t SRV _ldap._tcp.gunas.int *

*Returns* Host _ldap._tcp.gunas.int not found: 3(NXDOMAIN)


If I try *host -t A dc1s.gunas.int*

*Returns* Host dc1s.gunas.int not found: 3(NXDOMAIN)


I think the problem is with DNS working


I'm not sure if after updates or not, because the monitor says it all OK.


root@dc1s:~# dig gunas.int @localhost


; <<>> DiG 9.16.1-Ubuntu <<>> gunas.int @localhost

;; global options: +cmd

;; Got answer:

;; ->>HEADER<<- opcode: QUERY, status: NXDOMAIN, id: 6585

;; flags: qr rd ra ad; QUERY: 1, ANSWER: 0, AUTHORITY: 1, ADDITIONAL: 1


;; OPT PSEUDOSECTION:

; EDNS: version: 0, flags:; udp: 4096

; COOKIE: cbfd0ae2a1293dde010000005ebd4ac344d7a9c2bd4a38fc (good)

;; QUESTION SECTION:

;gunas.int. IN A


;; AUTHORITY SECTION:

int. 1773 IN SOA sns.dns.icann.org. noc.dns.icann.org. 2020050830 3600 
1800 604800 3600


;; Query time: 0 msec

;; SERVER: 127.0.0.1#53(127.0.0.1)

;; WHEN: Thu May 14 14:42:27 BST 2020

;; MSG SIZE rcvd: 123


----------------------------------------------------------------------------------------------------------


root@dc1s:~# s*ystemctl status bind9*

● named.service - BIND Domain Name Server

Loaded: loaded (/lib/systemd/system/named.service; enabled; vendor 
preset: enabled)

Active: active (running) since Thu 2020-05-14 14:38:26 BST; 13s ago

Docs: man:named(8)

Main PID: 1389 (named)

Tasks: 8 (limit: 2282)

Memory: 17.1M

CGroup: /system.slice/named.service

└─1389 /usr/sbin/named -f -u bind


May 14 14:38:26 dc1s named[1389]: command channel listening on ::1#953

May 14 14:38:26 dc1s named[1389]: managed-keys-zone: loaded serial 19

May 14 14:38:26 dc1s named[1389]: zone 127.in-addr.arpa/IN: loaded serial 1

May 14 14:38:26 dc1s named[1389]: zone 0.in-addr.arpa/IN: loaded serial 1

May 14 14:38:26 dc1s named[1389]: zone 255.in-addr.arpa/IN: loaded serial 1

May 14 14:38:26 dc1s named[1389]: zone localhost/IN: loaded serial 2

May 14 14:38:26 dc1s named[1389]: all zones loaded

May 14 14:38:26 dc1s named[1389]: running

May 14 14:38:27 dc1s named[1389]: managed-keys-zone: Key 20326 for zone 
. is now trusted (acceptance timer complete)

May 14 14:38:36 dc1s named[1389]: resolver priming query complete

root@dc1s:~#



*From syslog*

May 14 15:39:04 dc1s systemd-resolved[644]: Server returned error 
NXDOMAIN, mitigating potential DNS violation DVE-2018-0001, retrying 
transaction with reduced feature level UDP.

May 14 15:39:04 dc1s ntpd[717]: Soliciting pool server 81.21.65.169

May 14 15:39:04 dc1s ntpd[717]: Soliciting pool server 83.137.225.123

May 14 15:39:04 dc1s ntpd[717]: Soliciting pool server 37.59.47.71

May 14 15:39:04 dc1s systemd-resolved[644]: Server returned error 
NXDOMAIN, mitigating potential DNS violation DVE-2018-0001, retrying 
transaction with reduced feature level UDP.

May 14 15:39:04 dc1s systemd-resolved[644]: message repeated 2 times: [ 
Server returned error NXDOMAIN, mitigating potential DNS violation 
DVE-2018-0001, retrying transaction with reduc>

May 14 15:39:04 dc1s ntpd[717]: Soliciting pool server 91.189.89.199

May 14 15:39:04 dc1s systemd-resolved[644]: Server returned error 
NXDOMAIN, mitigating potential DNS violation DVE-2018-0001, retrying 
transaction with reduced feature level UDP.

May 14 15:39:05 dc1s systemd-resolved[644]: message repeated 19 times: [ 
Server returned error NXDOMAIN, mitigating potential DNS violation 
DVE-2018-0001, retrying transaction with redu>

May 14 15:39:05 dc1s ntpd[717]: Soliciting pool server 91.189.94.4

May 14 15:39:05 dc1s ntpd[717]: Soliciting pool server 85.199.214.102

Thanks

Rick

