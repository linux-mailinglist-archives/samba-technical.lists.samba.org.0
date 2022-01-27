Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6771A49E411
	for <lists+samba-technical@lfdr.de>; Thu, 27 Jan 2022 15:02:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=j9B2bR1sAWhpmbKOGk/kxn+1t5/3k87+A6pjvmmAJnk=; b=Yev3zYLilzZr9whHCcAOAW9zjG
	X+E90lbTwrirhInv4PWu56TmJnQ9T/o5Og5Rpm6Nkx7VyXibAgYW+CO9mfRtH1wWgOCJA6RMObplk
	janPQQI/0VAw4lV0U1t4ygaiMNnFTRNLXjs0crTRNdocL9IIkUorFYCyDFLtlBPK05OehGuoSX+sr
	r3ZsQecyNREkWlFHXfgTdJnR/pZLIRVxp5qEKGQ1V8cGqXxsnDNL8oiuLFFhLPwRE0Dwjz0UyjEh+
	kp3meqw3xuPqpTjj7nTtqxCisR+YhvwJ0ohsJvsQfNALxU79JVOjBi3QwmnQgwMDu5v+lA1gQUuF3
	aIXcMDKA==;
Received: from ip6-localhost ([::1]:32532 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nD5Lr-001d3D-RA; Thu, 27 Jan 2022 14:02:15 +0000
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36]:38607) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nD5Ll-001d34-S3
 for samba-technical@lists.samba.org; Thu, 27 Jan 2022 14:02:12 +0000
Received: by mail-yb1-xb36.google.com with SMTP id i62so8973130ybg.5
 for <samba-technical@lists.samba.org>; Thu, 27 Jan 2022 06:02:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=UQr3JVb2CpZRtLdUs/4JiOY368Bk8ZqOP1dl1BMnOgo=;
 b=LvdJ42qJrENpMZaQfDg2U3UAQMu2Oxlv7rAr57m8MKsSCcstitzePj7/vs96wB12Fe
 V2s9HwA4CGV19Ycb4smd4i2nlUjy8EyeU4RVAPPuA4wMnl0ZIb2Ndim/xpWrUT3VjwZ9
 c1q3CyAh1lUk5Oo5PupJrqiCSEGOUZB2V/l1Ph+JqDMszv9PVbNtUnuA9bcxe3nsVLE0
 sgwMUA/NdIWMOdc9Ej3Mnt7VyrtU+7DMoTuBEm284v/JTMZ7EIBrjab/B5TnThNboOrq
 ojSDVmfoLWLUSWj8QPrjY4oPQqxH8heJ8qAvR7Xid2YtSRf51pfVLYxZYMH3GRDlW0mN
 6rVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=UQr3JVb2CpZRtLdUs/4JiOY368Bk8ZqOP1dl1BMnOgo=;
 b=rA8TlZBSCqE/cTpITuZmH2UUNWm4Z1PoOpQXZX0mSWsi0LVNJi9JW+BAEGh6I5G6AH
 D/diXBogWFmfqfS41W0qKz94f10vPIfjL1ykYOVjQZv8t62Y5IvRwTQ8AnHAKhRSNnnL
 myZbDGOp6/l6OdwnL4IBQyEFvLjznVgd1cC0kmosMHUg+8wNQ6OYJz3CCPK9pYdwkKUq
 AKZ2ENFxmcs8uFzx2K9fTcErKz/2oFcWrZ8xbApriIj7swHbNtrU5LPZSUK1gMRB+lYb
 yeFh922Z4Lhk1sOp6Zo9beeUQlsGuBGZi8AeVpjyxHGCu/Kr4/rPRAuH/qXlYqXz0fae
 vLiQ==
X-Gm-Message-State: AOAM5321igjXBAw/H7PoZcAsvsuM/cYX9trzJeCHnhvr96VZcEej1R7U
 B6YbUhzceOrDZ7T89hHO/7IEJq/gJL1ZfHGBe91WDHX+FyraVQ==
X-Google-Smtp-Source: ABdhPJxVLan1Q9lt+bQxYsssGZ4jm1MlLdWKc1/6J36aWW+kliHsadje15ZW/oztGWcS2teIv8keUR0LOWzZnPXeXLA=
X-Received: by 2002:a05:6902:721:: with SMTP id
 l1mr5772499ybt.148.1643292127332; 
 Thu, 27 Jan 2022 06:02:07 -0800 (PST)
MIME-Version: 1.0
Date: Thu, 27 Jan 2022 16:04:22 +0200
Message-ID: <CAKYNSb7s=NsbZG6XxnvxhegnrWKTS05oVVa2MBkQ-528AqbnRw@mail.gmail.com>
Subject: samba-tool gpo not finding DC's
To: samba-technical@lists.samba.org
Content-Type: text/plain; charset="UTF-8"
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
From: Alecsandru Chirosca via samba-technical <samba-technical@lists.samba.org>
Reply-To: Alecsandru Chirosca <alecsandru.chirosca@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I have a strange issue with samba 4.13.14 on Ubuntu 20.04 LTS where almost
all samba-tool functionalities are OK but the GPO options are not working
with the following exception

# samba-tool gpo listall -U Administrator -d3
...
dns child failed to find name '_ldap._tcp.INOE.LAN' of type SRV
resolve_lmhosts: Attempting lmhosts lookup for name _ldap._tcp.INOE.LAN<0x0>
finddcs: Failed to find SRV record for _ldap._tcp.INOE.LAN
ERROR(runtime): uncaught exception - ('Could not find a DC for domain',
NTSTATUSError(3221225524, 'The object name is not found.'))
  File "/usr/lib/python3/dist-packages/samba/netcmd/__init__.py", line 186,
in _run
    return self.run(*args, **kwargs)
  File "/usr/lib/python3/dist-packages/samba/netcmd/gpo.py", line 464, in
run
    self.url = dc_url(self.lp, self.creds, H)
  File "/usr/lib/python3/dist-packages/samba/netcmd/gpo.py", line 127, in
dc_url
    raise RuntimeError("Could not find a DC for domain", e)

DNS is resolved against the integrated samba DNS server (127.0.0.1 and LAN
address).

Dig, on the other hand works as expected:

# dig SRV _ldap._tcp.inoe.lan

; <<>> DiG 9.16.1-Ubuntu <<>> SRV _ldap._tcp.inoe.lan
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 22559
;; flags: qr aa rd ra ad; QUERY: 1, ANSWER: 2, AUTHORITY: 1, ADDITIONAL: 0

;; QUESTION SECTION:
;_ldap._tcp.inoe.lan.           IN      SRV

;; ANSWER SECTION:
_ldap._tcp.inoe.lan.    900     IN      SRV     0 100 389 adc.inoe.lan.
_ldap._tcp.inoe.lan.    900     IN      SRV     0 100 389 adc1.inoe.lan.

;; AUTHORITY SECTION:
inoe.lan.               3600    IN      SOA     adc.inoe.lan.
hostmaster.inoe.lan. 134 900 600 86400 3600

;; Query time: 0 msec
;; SERVER: ::1#53(::1)
;; WHEN: Thu Jan 27 15:50:07 EET 2022
;; MSG SIZE  rcvd: 133

same for samba-tool dns

# samba-tool dns query 127.0.0.1 inoe.lan adc.inoe.lan ALL -U Administrator
Password for [INOE\Administrator]:
  Name=, Records=1, Children=0
    A: xx.xxx.xx.xxx (flags=f0, serial=110, ttl=900)


I am pursuing an issue related to the GPO's not being applied to domain
computers (regarding department shares) when I encountered this issue.
Can you please point me in the right direction regarding this issue?

smb.conf (relevant part)

[global]
        dns forwarder = 8.8.8.8
        netbios name = ADC
        realm = INOE.LAN
        server role = active directory domain controller
        workgroup = INOE
        idmap_ldb:use rfc2307 = yes
        allow dns updates = nonsecure
        full_audit: failure = none
        full_audit: success = pwrite write
        full_audit: prefix = IP=%I | USER=%u | MACHINE=%m | VOLUME=%S
        full_audit: facility = local7
        full_audit: priority = NOTICE
        interfaces = xx.xxx.xx.xxx/25 eno1 lo
        ldap server require strong auth = no
        log level = 1 auth_audit:3 dsdb_audit:3 dsdb_password_audit:3
dsdb_transaction_audit:3
        min protocol = SMB2
        name resolve order = host wins lmhosts bcast

samba-tool ntacl sysvolcheck and
samba-tool ntacl sysvolreset
work without any issues.

RSAT does not report any issues.
The main issue with GPO's is only related to new computers joining the
domain (Windows 10), old computers work as expected.

Best Regards,
Alecsandru Chirosca
