Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D8C0A19D28
	for <lists+samba-technical@lfdr.de>; Thu, 23 Jan 2025 04:15:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=w5kzfd7gI5abEY9u/jfYt1ZUK0uZwZTNzVYap+eYtzg=; b=rzSy/8q8w51qFP2ztErLe2ctBq
	RycbBaWvaWKEF0zcVji4hDKk/+d75yrBQZykQpN3dEbV3rsCS/tPG780yD4XhDTjBVjoEHTr/zJw6
	7J3ge7cMXngA81Zcgo4uwWw7uird8Ul/jR5Rd5/iShyYZocPCqwtSnDkTQF+zfcBu/g3iq5c7X5fK
	fzDJ0veK9/qTk4bTfReLPiWp3OP1gf3wPRNBD/RXMt4z04O9CGnBzG5mVMgHDyKj/Veo0+rO+a9Gu
	xcHlarCl6wt25kc5Z7N8iJ7aRxZnPRLKwdHHG0E/mSLV3g6Vhi48ydKXPEUyLVoifHEAFYlwkpSGs
	rqzB/OBg==;
Received: from ip6-localhost ([::1]:26164 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1tanfq-009H3Y-Hl; Thu, 23 Jan 2025 03:14:30 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131]:45302) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tanfm-009H3R-99
 for samba-technical@lists.samba.org; Thu, 23 Jan 2025 03:14:28 +0000
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-53f757134cdso510368e87.2
 for <samba-technical@lists.samba.org>; Wed, 22 Jan 2025 19:14:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737602064; x=1738206864; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w5kzfd7gI5abEY9u/jfYt1ZUK0uZwZTNzVYap+eYtzg=;
 b=dB5XtZp8+BeAOuPCFWIe+OZk/26gPWlKjlWdg1GMi7YwWwk9zmKEcCDlALJgZPoQnC
 sN2OHqa5c79yLXYNeohbE4RI5rGdBy/fZlJBHP5XLo6Asgqv4ExnqH+86Rq6541HjWQU
 GHWGaTuT9nw1kzzuignpHtyVt4jazQ33ev+yl5JVG+SnH1PEHE4WPk9Xm5NpHdVIhBm1
 U91jQfHeMYYIIAyta1JZ7+b+5lsxixtsStHrSxoaTzWQqZD1siPm9NQPBpLBI5YIRaAJ
 LjpCwpBKkQochWpS8OezCWV96V/2hGs7T0kms+oJOVkkCuTNXucSQw0R/58n5cxoZJV5
 Ny2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737602064; x=1738206864;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w5kzfd7gI5abEY9u/jfYt1ZUK0uZwZTNzVYap+eYtzg=;
 b=mRITifidxGOlvRMoRycWlZvFTWHZ91eUsoMFIy4Fkeh9VVSmGBr23R1oSRNmzyJggH
 UCsWr/RNM6JnRA+GEn5jxOOqPbET+evqtvl0eCUWCPDu4AuEuVjtvoqgZZbIL44y6TWR
 Epv3aiseuPzOF9/0gFyxnD+p75oNsYKW4sqRr6REl6+o63sVkOQlmUkScxfOHyciLA8o
 GXrQy/aDK7GFqbshsselizA/DHfH8RR5ACxtZSIejW5Q9d3/v/S+Z1SF2TG4ZWmN+Yku
 WNnJ8OiknTPQt2iLjvONrARfvlZZrGPHrn9UvovGjy5tnlHXNALRmVVOtx9Ivczg8DVU
 YzYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4iPH1rasoM2bP7YAvCE04ky+wqtpFSwHdD2DripBj3hI+pl2PRiBupZT1BIDvB6Mrdmrr6k+lFVLODF/MoJk=@lists.samba.org
X-Gm-Message-State: AOJu0YztSlTRbQQWYH4SIf+x5JJ1dxeSoWKDKp6LiwTPcr0jSQYCr6WT
 tsHVDMOQ7RT7a4kVne3Qz4Bo7n2mx4alQArhL+ktVKExTDmKQW8P0NiSskZKVCCsn8jicikJb8K
 J0E0Mns1resEqJpHeTT0mMRwdQnc=
X-Gm-Gg: ASbGncsVYGVRGLMs7CKc6J9crnD7VJ+2dYH6R0g6YbtzbX5U9NjPJweUTB/kyeXxPt1
 urlINpIFJv3UL0MEfuTG3V3cJycXUJ4S2rmQbsutUrmW92foJcrTF3M+8ROM0TQ==
X-Google-Smtp-Source: AGHT+IG+OtE0UdWI8FRrZC5NH3rowiCHIhfosq9WDlxGiwZ0BAwScGeNY6jvvwo+nvGkutB4sSrTMIxD38sm3S7Z56s=
X-Received: by 2002:a05:6512:32c7:b0:540:3566:5760 with SMTP id
 2adb3069b0e04-5439c265ce7mr7974526e87.35.1737602064287; Wed, 22 Jan 2025
 19:14:24 -0800 (PST)
MIME-Version: 1.0
References: <CAH2r5mvZkLmkmR+faL2gepGkhMg1tGgW1wt+tFr9NvW2ihK+3Q@mail.gmail.com>
 <Z43pEk7WDs6dTQ1M@toolbox> <4942506.OV4Wx5bFTl@magrathea>
 <CAH2r5mvy2b35BAaUnqHdO7dLb9pRHy=LXv7YMBhCc76fUst05Q@mail.gmail.com>
 <Z5CbjKR8Fl5dgx6e@toolbox>
In-Reply-To: <Z5CbjKR8Fl5dgx6e@toolbox>
Date: Wed, 22 Jan 2025 19:14:13 -0800
X-Gm-Features: AWEUYZkKLhL0pAEYWbYyiKdX64HwgpkwGGi8e-eYTQzm1A-klRBhd1JbeznB8BI
Message-ID: <CAH2r5mvPQu8B05pbgnAqjdyFNO48pAgZAeYtXKWhvz2g+WjR2w@mail.gmail.com>
Subject: Re: Local KDC and Samba
To: Alexander Bokovoy <ab@samba.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Cc: Andreas Schneider <asn@samba.org>, samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, Jan 22, 2025 at 1:18=E2=80=AFAM Alexander Bokovoy <ab@samba.org> wr=
ote:
>
> On =D0=90=D1=9E=D1=82, 21 =D1=81=D1=82=D1=83 2025, Steve French wrote:
> > Although install of the localkdc seemed to work, running setup on it fa=
iled:
> > root@localhost-live:/home/smfrench# dnf install localkdc
> > Updating and loading repositories:
> > Repositories loaded.
> > Package                   Arch   Version                   Repository
> >              Size
> > Installing:
> >  localkdc                 x86_64 0.0.1-14.fc41
> > copr:copr.fedorainf  30.4 KiB
> > Installing dependencies:
> >  certmonger               x86_64 0.79.20-2.fc41            fedora
> >           2.5 MiB
> >  krb5-pkinit              x86_64 1.21.3-121.fc41
> > copr:copr.fedorainf 121.2 KiB
> >  krb5-server              x86_64 1.21.3-121.fc41
> > copr:copr.fedorainf 784.6 KiB
> >  libkadm5                 x86_64 1.21.3-121.fc41
> > copr:copr.fedorainf 218.2 KiB
> >  localkdc-selinux         x86_64 0.0.1-14.fc41
> > copr:copr.fedorainf  10.1 KiB
> >
> > Transaction Summary:
> >  Installing:         6 packages
> >
> > Total size of inbound packages is 1 MiB. Need to download 1 MiB.
> > After this operation, 4 MiB extra will be used (install 4 MiB, remove 0=
 B).
> > Is this ok [y/N]: y
> > [1/6] localkdc-0:0.0.1-14.fc41.x86_64           100% |  28.8 KiB/s |
> > 18.2 KiB |  00m01s
> > [2/6] certmonger-0:0.79.20-2.fc41.x86_64        100% | 824.8 KiB/s |
> > 602.1 KiB |  00m01s
> > [3/6] krb5-server-0:1.21.3-121.fc41.x86_64      100% | 376.8 KiB/s |
> > 300.0 KiB |  00m01s
> > [4/6] krb5-pkinit-0:1.21.3-121.fc41.x86_64      100% | 319.9 KiB/s |
> > 59.8 KiB |  00m00s
> > [5/6] libkadm5-0:1.21.3-121.fc41.x86_64         100% | 330.6 KiB/s |
> > 77.7 KiB |  00m00s
> > [6/6] localkdc-selinux-0:0.0.1-14.fc41.x86_64   100% |  81.7 KiB/s |
> > 19.9 KiB |  00m00s
> > -----------------------------------------------------------------------=
-----------------
> > [6/6] Total                                     100% | 678.3 KiB/s |
> > 1.1 MiB |  00m02s
> >
> >
> > root@localhost-live:~# localkdc-setup
> > The parent of location "/var/kerberos/localkdc/kdc.crt" could not be
> > accessed due to insufficient permissions.
> > /usr/bin/local-getcert: Failed to create pkinit certificates
> >
> > But it looks like it has sufficient permissions:
> >
> > root@localhost-live:~# stat /var/kerberos/localkdc
> >   File: /var/kerberos/localkdc
> >   Size: 16            Blocks: 0          IO Block: 4096   directory
> > Device: 0,42    Inode: 367888      Links: 1
> > Access: (0755/drwxr-xr-x)  Uid: (    0/    root)   Gid: (    0/    root=
)
> > Context: system_u:object_r:var_t:s0
> > Access: 2025-01-21 19:42:50.669926708 -0800
> > Modify: 2025-01-21 19:42:22.342659428 -0800
> > Change: 2025-01-21 19:42:22.342659428 -0800
> >  Birth: 2025-01-21 19:41:03.323891871 -0800
> >
> > Any ideas why this would fail?
>
> There is incomplete SELinux policy yet. Please run in permissive for
> time being, we need to fix the policy.

Disabling selinux did help and fixed the localkdc-setup setup

The last step of his instructions says to do kinit, but kinit is not
installed in his image,
or as a dependency of "dnf install localkdc" so I had to reboot the
workstation and
then do "dnf install krb5-workstation" (hopefully doesn't need a
special version of kinit?!)

After rebooting the localkdc was not available so couldn't do kinit.  How d=
o you
restart it?   What I tried is below:

root@fedora:/home/smfrench# systemctl start localkdc
Job for localkdc.service failed because the control process exited
with error code.
See "systemctl status localkdc.service" and "journalctl -xeu
localkdc.service" for details.
root@fedora:/home/smfrench# systemctl status localkdc.service
=C3=97 localkdc.service - Local Kerberos KDC
     Loaded: loaded (/usr/lib/systemd/system/localkdc.service; static)
    Drop-In: /usr/lib/systemd/system/service.d
             =E2=94=94=E2=94=8010-timeout-abort.conf, 50-keep-warm.conf
     Active: failed (Result: exit-code) since Wed 2025-01-22 19:09:26
PST; 13s ago
 Invocation: 1996ca595fe74329882d55bc94779265
TriggeredBy: =E2=97=8F localkdc.socket
    Process: 5066 ExecStart=3D/usr/sbin/krb5kdc -P /run/localkdc/kdc.pid
-w 1 (code=3Dexited, status=3D1/FAILURE)
   Mem peak: 9.3M
        CPU: 23ms

Jan 22 19:09:26 fedora.local systemd[1]: Starting localkdc.service -
Local Kerberos KDC...
Jan 22 19:09:26 fedora.local krb5kdc[5066]: krb5kdc: cannot initialize
realm FEDORA.LOCALKDC.SITE - see log file >
Jan 22 19:09:26 fedora.local systemd[1]: localkdc.service: Control
process exited, code=3Dexited, status=3D1/FAILURE
Jan 22 19:09:26 fedora.local systemd[1]: localkdc.service: Failed with
result 'exit-code'.
Jan 22 19:09:26 fedora.local systemd[1]: Failed to start
localkdc.service - Local Kerberos KDC.
root@fedora:/home/smfrench# exit
exit


smfrench@fedora:~$ kinit asn@SAMBAKDC.LOCALKDC.SITE
kinit: Cannot find KDC for realm "SAMBAKDC.LOCALKDC.SITE" while
getting initial credentials


Ideas how to restart the local KDC?

--
Thanks,

Steve

