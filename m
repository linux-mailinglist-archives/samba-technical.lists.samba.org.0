Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3487C19AA81
	for <lists+samba-technical@lfdr.de>; Wed,  1 Apr 2020 13:10:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=qlR7oXybAzQGqhrvIrJy0gMAuT3P/9JT3yoNBEkSxfY=; b=5UDmPFlWPLNOh2ekUB1JYSQcZ/
	szzdhwxpqtAy5HRXKxcaGwQ38cKdr5ugv7IGAotIrwJXWZvN0H/FrtBQZ/dauGxmEkzwk4i4GLdb5
	ZVctdW+Y7GqxzHvvS9whsfUfN0QimJJtKNFFSq1l5GNATDtGwaxIRe3GKp/eI8C/XCYLxiCZEk2Z1
	JdyFF3ci7msYNUlQelAqTrXNMr6nUOaSuXjxwKYeE+fI+2IhMa4A1BNkze9LLlwFQM2uoMeRF+CR0
	G5ZUPumrUK5zvNxeuTzNVUE0XG+146FFcyLY02fIqaCAlC2fJD9tWDj4Y5jtQiI67rRSNfCSqrZD8
	gP1c3UbA==;
Received: from localhost ([::1]:23248 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jJbFt-002yln-BB; Wed, 01 Apr 2020 11:09:57 +0000
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36]:42703) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jJbFn-002yle-CP; Wed, 01 Apr 2020 11:09:54 +0000
Received: by mail-yb1-xb36.google.com with SMTP id c13so9761858ybp.9;
 Wed, 01 Apr 2020 04:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=B5s+yn5VsI28Pdhbrqzs6oPOC/8tBwVmMdSdWetzilk=;
 b=BcUbaI1ZPSITvmCxFJQkhZt/w1DQJURjQF9XzYqL5aNcKJ7LD8px9rrP76aJR+gdpe
 fXPSQia3UrqxMcAToJ9qTfZmNsUNzjIZ+xccEfj2R8APg8b5LstlmU75cqXFw9Ek4/u1
 jqM2HYdd9odxVlz/GXM3TQXCLBUlypaCqRm7uOhhi1L6HkzoaZVfQGSNP44fhHNM0QVY
 G1J039wJ/p7m+5JpQVFJK/WWx2/pFQAaFnW9SUwB6Fv5EYp8eBstdTaEryZhYhylyBZk
 xUYh/P5OpY0dgCbYVLj84vt0tVe1DhpUKXJ5Q65UXu+AeN8gkCHB3D39btPHCWHIyXOT
 nucw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=B5s+yn5VsI28Pdhbrqzs6oPOC/8tBwVmMdSdWetzilk=;
 b=RBlqO6TB840KKY0WdD52HEKaqPf5C3RLLmkyC231ixynHZkKrhzGvnxwWnjd10PSH0
 O7iG93YvpNHDHKPVXPVu0aFJHfXobqUCqk4ZhlWuPj0wXp3Em3N6N+x1pkuLLa6gCFr7
 RVDxz6qSIi4bV3OVzviYEIRQ4uKIilF+ODzE9X5x+Uh3Tq5TrKKkRSbYVd5/WWT9V34m
 DI1B40s9JSrv7ibkt7hkZuLFD4xVCYDqxahGd8IhycqSdlyfLWJe0pC7SgWU0hIUx8fi
 4BWYIihcJ+USMX9tqA2IeYDS3CAFwV61hXjRnhsrnbKxaC170f0vyI3Dw2x8IYZSE0q8
 Qs4Q==
X-Gm-Message-State: ANhLgQ2gF7YKKxyre1xUL4Jp+fVS+xJW1wTgne9G8BVD/bPiFr5IsqeG
 LgfmtO9t87S8V7JlL23CeYe4BMtpw+LAUqGu+dgVJo+0NSs=
X-Google-Smtp-Source: ADFU+vvUdpg+DZAG/k/nt3OMAu2c8PQNR8gg/CHi0RWjeaaf4cR/L8sfB5C4Rmw92wob5EisE9Vjo9P3s276YyywQrA=
X-Received: by 2002:a25:ac6:: with SMTP id 189mr14742183ybk.6.1585739388837;
 Wed, 01 Apr 2020 04:09:48 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 1 Apr 2020 16:39:37 +0530
Message-ID: <CANT5p=oAdZGMmrwuF_95qF9oZsf1ap-of0O=4s+3L1Ckq7=9Uw@mail.gmail.com>
Subject: Missing domain user tickets with winbind
To: samba-technical@lists.samba.org, samba@lists.samba.org
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
From: Shyam Prasad N via samba-technical <samba-technical@lists.samba.org>
Reply-To: Shyam Prasad N <nspmangalore@gmail.com>
Cc: sribhat.msa@outlook.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

My name is Shyam Prasad. I work at Microsoft in the Azure Files team.
For the past few days, I've been working on getting the Azure Linux VMs to
join the AD domain in Azure, login as domain users, and mount Azure file
shares over SMB3.

Most things work fine. Except that I need perform a few Kerberos related
tasks manually, for the SMB3 mount to work with domain user credentials.
I did some debugging of the issue, and looks like cifs.upcall (the
userspace helper program for cifs.ko) is unable to find the krb5 TGT for
the domain user in the cred-cache. If the cred-cache is missing, it looks
for it in the system krb5.keytab.

Since winbind is configured with kerberos method "secrets and keytab", I
would expect either the secrets.tdb or the krb5.keytab to have an entry for
the domain user lxsmbadmin. Even with the domain user already logged in
through ssh, I'm unable to get those in both those places. cred-cache file
is not created in the first place.

With the domain user already logged in through ssh, I expected that the
kerberos TGT would already have been retrieved and stored locally.
Where does winbind store its Kerberos tickets, so that I can point
cifs.upcall to look there for tickets instead?

The mount only works when I use kinit to populate the cred-cache with the
domain user.

Any help in troubleshooting this issue is appreciated.

Also, I'm interested to know, how can I enable the debug logs in the
libkrb5 shared libraries that are built from the samba source code? I don't
see the debug logs in that code being logged, even if log level is set to
maximum in smb.conf.

Regards,
Shyam

=======================================================
Details of my setup:
I'm using an Ubuntu 19.10 server VM.
I'm mounting as the local root user, however, I'm using a domain user
credentials for mounting the using sec=krb5.
Below are my mount options:
vers=3.0,sec=krb5,credentials=/home/localadmin/.smb3credentials,serverino,noperm,nosharesock,mfsymlinks,uid=lxsmbadmin,gid='domain
users'

The VM is already joined to the AD domain aaddomain.example.com using
winbind.
This is what my smb.conf looks like for winbind:
localadmin@lxsmb-canvm13:~$ cat /etc/samba/smb.conf
[global]
   workgroup = AADDOMAIN
   security = ADS
   realm = AADDOMAIN.EXAMPLE.COM

   winbind refresh tickets = Yes
   vfs objects = acl_xattr
   map acl inherit = Yes
   store dos attributes = Yes

   dedicated keytab file = /etc/krb5.keytab
   kerberos method = secrets and keytab

   winbind use default domain = Yes

   load printers = No
   printing = bsd
   printcap name = /dev/null
   disable spoolss = Yes

   log file = /var/log/samba/log.%m
   log level = 10

   idmap config * : backend = tdb
   idmap config * : range = 3000-7999

   idmap config AADDOMAIN : backend = rid
   idmap config AADDOMAIN : range = 10000-999999

   template shell = /bin/bash
   template homedir = /home/%U

localadmin@lxsmb-canvm13:~$ cat /etc/krb5.conf
[libdefaults]
        default_realm = AADDOMAIN.EXAMPLE.COM
        dns_lookup_realm = false
        dns_lookup_kdc = true

Initially, I tried to use the ubuntu apt packages to install winbind and
related packages.
After going through a bit of code, I wanted to be able to print the debug
logs.
So I decided to install winbind from the latest source:
master branch on git://git.samba.org/samba.git

Here is the configure I used to build it:
./configure --with-systemd --bindir=/usr/bin --sbindir=/usr/sbin
--libdir=/usr/lib/x86_64-linux-gnu/samba --sysconfdir=/etc/samba
--localstatedir=/run/samba --includedir=/usr/include/
--datadir=/usr/share/samba --mandir /usr/share/man --enable-debug
--enable-developer --systemd-install-services
--with-systemddir=/usr/lib/systemd/system
--with-privatedir=/var/lib/samba/private --with-systemd --with-pam

After tweaking a few config files here and there, I've now reached the same
state as when I was running winbind from Ubuntu packages.
I'm now able to ssh/su as the domain user to this system.

However, I do not see the cred-cache populated.
localadmin@lxsmb-canvm13:~/samba$ sudo klist
klist: No ticket file: /tmp/krb5cc_0
localadmin@lxsmb-canvm13:~/samba$ ls /tmp/krb*
ls: cannot access '/tmp/krb*': No such file or directory

After a bit of code reading of cifs.upcall, it looks to me like the
expectation is that cred-cache would be populated for the domain user.
If in case the cred-cache is missing, then it creates a new cred-cache from
the keytab at /etc/krb5.keytab

So clearly, the expectation is that atleast the keytab is already
populated.

The kerberos method that I've chosen in smb.conf is "secrets and keytab".
So I expect either the secrets.tdb or the krb5.keytab to have an entry for
the domain user lxsmbadmin.
However, I do not see those entries in either of them:

localadmin@lxsmb-canvm13:~$ sudo tdbdump
/var/lib/samba/private/secrets.tdb|grep -i lxsmbadmin
localadmin@lxsmb-canvm13:~$

localadmin@lxsmb-canvm13:~$ sudo ktutil list|grep -i lxsmbadmin
localadmin@lxsmb-canvm13:~$

With the domain user already logged in through ssh, I expected that the
kerberos TGT would already have been retrieved and stored locally.
Where would I find that?

Do note that if I populate the cred-cache manually with the kinit utility
like so:
localadmin@lxsmb-canvm13:~$ sudo kinit lxsmbadmin@aaddomain.example.com
lxsmbadmin@aaddomain.example.com's Password:
localadmin@lxsmb-canvm13:~$

The cred-cache does get populated and I'm then able to mount the file share
successfully.

With the log level set to 10 in smb.conf, the logging in /var/log/samba/ is
pretty verbose. I can share those if needed for further debugging.

=======================================================
