Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 99AF619ABE5
	for <lists+samba-technical@lfdr.de>; Wed,  1 Apr 2020 14:43:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=smZLWniZmlPlSfO7/aD5NVGc9IxninGArKNOx3vDS8s=; b=nDTWJkTXorDFsRy2RTrNJ2X3+H
	8KJb2L6PvT4v5K/4aLCdQw9zfk4/ZWfNEg0KH5irs9NiBfZ6R83wj+r+IvJAnK0lWZq6umVGlW76D
	soDwsEEFuxJz8RUUVne8t7QtpC6f6Q3fTc8YqkWOVxWWZ4z1op4Lwa/baLAOoV3k+RiO/TizjS/1d
	sI3Nhaum1mENB8+uGxWPp+KBIPUT56FVq82QKzl1F5ZvVdCuQrh7KpvzERUZlnGypjYN/RehTkP/u
	NgurnZc0SADF4KODVn44OQ02pA2r4OK9rG1De7iWEUvdwZBBHfHwMKlqrfBoGfjw6hFhXFi1kAjzk
	TpGchIuQ==;
Received: from localhost ([::1]:36154 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jJchu-0030aH-W2; Wed, 01 Apr 2020 12:42:59 +0000
Received: from mail-yb1-xb44.google.com ([2607:f8b0:4864:20::b44]:38684) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jJcho-0030ZY-8Y; Wed, 01 Apr 2020 12:42:55 +0000
Received: by mail-yb1-xb44.google.com with SMTP id 204so13141872ybw.5;
 Wed, 01 Apr 2020 05:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MgG1S+sRnL/MaGnKP3rSU5AgR/FW0io1mCzDE5e1E2A=;
 b=MzmQkZUeQEvO/hdeBUWGaqifQ14Aif+1nE3Rjj3dNHsIfYoJzhgqiIaqWM+csGj9rK
 CSGQeMoImbuqYP86JfcohTSks9c4LDhXCRtTVLIfo5xpwpWgE7mOA3oKwa42twIFVfmX
 vlbfFK3/B3EWrSziCqmmskvdFPWNx0hR+6q6Wdwnia0XTf46T1Bh1J/kleUOgj8YHcev
 Paad5CCiLu3TWr+tSqvjYJ9Aujq8YlE1XEjO+FYTHU+bWmDUDQozLDRuUjFU7Ulf5Rtg
 BKrYBbzN3baNT90FHZu6/VlrW1zgziBD3hmiMM5hEmHYSG9dnvyhFlaiTaLW7Jel42sU
 ILsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MgG1S+sRnL/MaGnKP3rSU5AgR/FW0io1mCzDE5e1E2A=;
 b=kj80R7flgv4VNSTRKwV2ghDrmztrdFMtWBVdl4Y5RMFJX697C8SvcVJ6mEgBVSrkJ+
 7ePZNRwd0JA3+Xq72Bbh7K50r7Y+B0/uFSy+qkMBgLlHl36Pw63aTPb1V+MsejFZfXMa
 iivgyesjNuQawzHEA+Ms4LKDKz1WG4H8u70vzdhDuEf9/fMSRH/iTp0f8C8zqlzDUrzV
 XKlgsQr2JAMxOWHfxYvtqpwc13tArNDrfYAdqOTaVSlqXacnmd4y4ic38CBuQVClP8F5
 C5GH/0mJ382LXNzVwSJzJWms7j4L3a7rTtYlufgNQ3Gp85ZZBqRp7kNZsTxBVWETGrZP
 Pzhg==
X-Gm-Message-State: ANhLgQ1i0h3maWMK3FsGDoja5DW30k5hs9Gl5yPfBYesPT7hmoBvlIEA
 iwTuLVexjoDkf8Vznl8DJbcGqqQOTLaFREha+YLkyLjUrME=
X-Google-Smtp-Source: ADFU+vsVdTqKxfDzNjsmZ8VM/t+ey3i6vWb67SLMP4SINcuT53zgssNuWa62I2i+bbgH7kxgRAIJ0mgJGLePrv2AlHM=
X-Received: by 2002:a25:9b82:: with SMTP id v2mr16162799ybo.96.1585744970481; 
 Wed, 01 Apr 2020 05:42:50 -0700 (PDT)
MIME-Version: 1.0
References: <CANT5p=oAdZGMmrwuF_95qF9oZsf1ap-of0O=4s+3L1Ckq7=9Uw@mail.gmail.com>
 <20200401113459.GW2735275@onega.vda.li>
In-Reply-To: <20200401113459.GW2735275@onega.vda.li>
Date: Wed, 1 Apr 2020 18:12:39 +0530
Message-ID: <CANT5p=qDVQdmmR571htauzK_FjrLOUHKDi5th8TG7KdftGpVVQ@mail.gmail.com>
Subject: Re: Missing domain user tickets with winbind
To: Alexander Bokovoy <ab@samba.org>
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
Cc: samba@lists.samba.org, sribhat.msa@outlook.com,
 samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Thanks. That worked. :)

However, I see the krb5cc file only if I login to ssh using the password.
If I use ssh private keys to login, I do not see this file being generated.
I guess this is because it doesn't use krb5 authentication with the AD
server in that case. This is not a major bottleneck, but wanted to
understand the scenario.

Regards,
Shyam

On Wed, Apr 1, 2020 at 5:05 PM Alexander Bokovoy <ab@samba.org> wrote:

> On ke, 01 huhti 2020, Shyam Prasad N via samba-technical wrote:
> > Hi,
> >
> > My name is Shyam Prasad. I work at Microsoft in the Azure Files team.
> > For the past few days, I've been working on getting the Azure Linux VMs
> to
> > join the AD domain in Azure, login as domain users, and mount Azure file
> > shares over SMB3.
> >
> > Most things work fine. Except that I need perform a few Kerberos related
> > tasks manually, for the SMB3 mount to work with domain user credentials.
> > I did some debugging of the issue, and looks like cifs.upcall (the
> > userspace helper program for cifs.ko) is unable to find the krb5 TGT for
> > the domain user in the cred-cache. If the cred-cache is missing, it looks
> > for it in the system krb5.keytab.
> >
> > Since winbind is configured with kerberos method "secrets and keytab", I
> > would expect either the secrets.tdb or the krb5.keytab to have an entry
> for
> > the domain user lxsmbadmin. Even with the domain user already logged in
> > through ssh, I'm unable to get those in both those places. cred-cache
> file
> > is not created in the first place.
> >
> > With the domain user already logged in through ssh, I expected that the
> > kerberos TGT would already have been retrieved and stored locally.
> > Where does winbind store its Kerberos tickets, so that I can point
> > cifs.upcall to look there for tickets instead?
>
> It all depends how you configured pam_winbind. Please see pam_winbind
> man page for Kerberos-related options (this outpout is from 4.11.7,
> newer versions have more ccache type variants):
>
>        krb5_auth
>            pam_winbind can authenticate using Kerberos when winbindd is
>            talking to an Active Directory domain controller. Kerberos
>            authentication must be enabled with this parameter. When
>            Kerberos authentication can not succeed (e.g. due to clock
>            skew), winbindd will fallback to samlogon authentication over
>            MSRPC. When this parameter is used in conjunction with
>            winbind refresh tickets, winbind will keep your Ticket
>            Granting Ticket (TGT) uptodate by refreshing it whenever
>            necessary.
>
>        krb5_ccache_type=[type]
>            When pam_winbind is configured to try kerberos authentication
>            by enabling the krb5_auth option, it can store the retrieved
>            Ticket Granting Ticket (TGT) in a credential cache. The type
>            of credential cache can be set with this option.  Currently
>            the only supported value is: FILE. In that case a credential
>            cache in the form of /tmp/krb5cc_UID will be created, where
>            UID is replaced with the numeric user id. Leave empty to just
>            do kerberos authentication without having a
>            ticket cache after the logon has succeeded.
>
>
> >
> > The mount only works when I use kinit to populate the cred-cache with the
> > domain user.
> >
> > Any help in troubleshooting this issue is appreciated.
> >
> > Also, I'm interested to know, how can I enable the debug logs in the
> > libkrb5 shared libraries that are built from the samba source code? I
> don't
> > see the debug logs in that code being logged, even if log level is set to
> > maximum in smb.conf.
> >
> > Regards,
> > Shyam
> >
> > =======================================================
> > Details of my setup:
> > I'm using an Ubuntu 19.10 server VM.
> > I'm mounting as the local root user, however, I'm using a domain user
> > credentials for mounting the using sec=krb5.
> > Below are my mount options:
> >
> vers=3.0,sec=krb5,credentials=/home/localadmin/.smb3credentials,serverino,noperm,nosharesock,mfsymlinks,uid=lxsmbadmin,gid='domain
> > users'
> >
> > The VM is already joined to the AD domain aaddomain.example.com using
> > winbind.
> > This is what my smb.conf looks like for winbind:
> > localadmin@lxsmb-canvm13:~$ cat /etc/samba/smb.conf
> > [global]
> >    workgroup = AADDOMAIN
> >    security = ADS
> >    realm = AADDOMAIN.EXAMPLE.COM
> >
> >    winbind refresh tickets = Yes
> >    vfs objects = acl_xattr
> >    map acl inherit = Yes
> >    store dos attributes = Yes
> >
> >    dedicated keytab file = /etc/krb5.keytab
> >    kerberos method = secrets and keytab
> >
> >    winbind use default domain = Yes
> >
> >    load printers = No
> >    printing = bsd
> >    printcap name = /dev/null
> >    disable spoolss = Yes
> >
> >    log file = /var/log/samba/log.%m
> >    log level = 10
> >
> >    idmap config * : backend = tdb
> >    idmap config * : range = 3000-7999
> >
> >    idmap config AADDOMAIN : backend = rid
> >    idmap config AADDOMAIN : range = 10000-999999
> >
> >    template shell = /bin/bash
> >    template homedir = /home/%U
> >
> > localadmin@lxsmb-canvm13:~$ cat /etc/krb5.conf
> > [libdefaults]
> >         default_realm = AADDOMAIN.EXAMPLE.COM
> >         dns_lookup_realm = false
> >         dns_lookup_kdc = true
> >
> > Initially, I tried to use the ubuntu apt packages to install winbind and
> > related packages.
> > After going through a bit of code, I wanted to be able to print the debug
> > logs.
> > So I decided to install winbind from the latest source:
> > master branch on git://git.samba.org/samba.git
> >
> > Here is the configure I used to build it:
> > ./configure --with-systemd --bindir=/usr/bin --sbindir=/usr/sbin
> > --libdir=/usr/lib/x86_64-linux-gnu/samba --sysconfdir=/etc/samba
> > --localstatedir=/run/samba --includedir=/usr/include/
> > --datadir=/usr/share/samba --mandir /usr/share/man --enable-debug
> > --enable-developer --systemd-install-services
> > --with-systemddir=/usr/lib/systemd/system
> > --with-privatedir=/var/lib/samba/private --with-systemd --with-pam
> >
> > After tweaking a few config files here and there, I've now reached the
> same
> > state as when I was running winbind from Ubuntu packages.
> > I'm now able to ssh/su as the domain user to this system.
> >
> > However, I do not see the cred-cache populated.
> > localadmin@lxsmb-canvm13:~/samba$ sudo klist
> > klist: No ticket file: /tmp/krb5cc_0
> > localadmin@lxsmb-canvm13:~/samba$ ls /tmp/krb*
> > ls: cannot access '/tmp/krb*': No such file or directory
> >
> > After a bit of code reading of cifs.upcall, it looks to me like the
> > expectation is that cred-cache would be populated for the domain user.
> > If in case the cred-cache is missing, then it creates a new cred-cache
> from
> > the keytab at /etc/krb5.keytab
> >
> > So clearly, the expectation is that atleast the keytab is already
> > populated.
> >
> > The kerberos method that I've chosen in smb.conf is "secrets and keytab".
> > So I expect either the secrets.tdb or the krb5.keytab to have an entry
> for
> > the domain user lxsmbadmin.
> > However, I do not see those entries in either of them:
> >
> > localadmin@lxsmb-canvm13:~$ sudo tdbdump
> > /var/lib/samba/private/secrets.tdb|grep -i lxsmbadmin
> > localadmin@lxsmb-canvm13:~$
> >
> > localadmin@lxsmb-canvm13:~$ sudo ktutil list|grep -i lxsmbadmin
> > localadmin@lxsmb-canvm13:~$
> >
> > With the domain user already logged in through ssh, I expected that the
> > kerberos TGT would already have been retrieved and stored locally.
> > Where would I find that?
> >
> > Do note that if I populate the cred-cache manually with the kinit utility
> > like so:
> > localadmin@lxsmb-canvm13:~$ sudo kinit lxsmbadmin@aaddomain.example.com
> > lxsmbadmin@aaddomain.example.com's Password:
> > localadmin@lxsmb-canvm13:~$
> >
> > The cred-cache does get populated and I'm then able to mount the file
> share
> > successfully.
> >
> > With the log level set to 10 in smb.conf, the logging in /var/log/samba/
> is
> > pretty verbose. I can share those if needed for further debugging.
> >
> > =======================================================
>
> --
> / Alexander Bokovoy
>


-- 
-Shyam
