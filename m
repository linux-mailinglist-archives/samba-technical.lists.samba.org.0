Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AEF819AADE
	for <lists+samba-technical@lfdr.de>; Wed,  1 Apr 2020 13:35:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=YUAQJib2tTrvlMqXtw7uhb2q6+wnL4DfTenMN6808eM=; b=juuWeZoWjQgRfgbdtuEHqMpDrq
	TfrN0eiK/YhH2DFnrRH2fQ5WMERMeu2PUcBFOvQKlIbHv4z/shAPtsRX6wXBMeA+C9vmRHUh4XBWX
	nQxGHHmwSnCOvQvJ5Xc36VOapSpgRsKbsaYVi7ElrnlrTBm7+1bF3UrrTUvnobOs8nT0a2aZSjRkv
	9nY8dRzxMkwjg9gGAQEilVO3LBsf6geslccB5FqnEn3YJ06H/Vu16HYsxuG1T5dLCzZRSMBp6QOpz
	Pd8MmK2D1Pqtn0VxaOfHW6WwbfXESwpIFf1dkl8T2TnZmhXDcpVgLb53qA7HLJSRiX8izzdtmqp5b
	yc8Rw5pg==;
Received: from localhost ([::1]:28794 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jJbeG-002zWd-T8; Wed, 01 Apr 2020 11:35:08 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:39130) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jJbeC-002zWU-36; Wed, 01 Apr 2020 11:35:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=YUAQJib2tTrvlMqXtw7uhb2q6+wnL4DfTenMN6808eM=; b=GZ1P5r3vuqlit/7AE0OeXsbup6
 0vqUS13R1OkWySI5tAO8SZKgREjCEPRGYvIRO/EbUekyyP07SbXpeDfCQDUlK9CR/tzNtgyrdAuZ/
 UO8lzokyQT1PxF6DqEjIo5Uf6mY9Z1DXtvSzSYOFwPifquNfngfqjB1L84QTZ4B8fXz4s9/aJidnb
 e5lHyAy6cXxSLZis3W2mffes03IfaYt30nfoSVAQQpk23AWXkqUCr3AZwD9XK1A8VgNSNFudCZqo8
 KSAAdmieC2LCWx7DVdd0QkUhmnhW7H4DRE2ZIDoraMM5/KFM4WU321TXWBMl7eWwi3brmMh1GAiE7
 w3UJjp4tfS1E8vMBOxVyKi/3wUkh8bZyKYXN4AgvTM5DhEyY1ai53QGbaaPQ+rlDApDA6GeOzASGq
 UZbkKR/MC7PbNYVLC/rDpkbHmyg9uu7G4QpFy//8AvYtKfvfIRvc12jO4jXiYzEFWMSVotYFdpv/p
 s1l03Ssqi6wmb/mQyAkQxUaA;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jJbeB-0006Q2-1z; Wed, 01 Apr 2020 11:35:03 +0000
Date: Wed, 1 Apr 2020 14:34:59 +0300
To: Shyam Prasad N <nspmangalore@gmail.com>
Subject: Re: Missing domain user tickets with winbind
Message-ID: <20200401113459.GW2735275@onega.vda.li>
References: <CANT5p=oAdZGMmrwuF_95qF9oZsf1ap-of0O=4s+3L1Ckq7=9Uw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANT5p=oAdZGMmrwuF_95qF9oZsf1ap-of0O=4s+3L1Ckq7=9Uw@mail.gmail.com>
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
From: Alexander Bokovoy via samba-technical <samba-technical@lists.samba.org>
Reply-To: Alexander Bokovoy <ab@samba.org>
Cc: samba@lists.samba.org, sribhat.msa@outlook.com,
 samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On ke, 01 huhti 2020, Shyam Prasad N via samba-technical wrote:
> Hi,
> 
> My name is Shyam Prasad. I work at Microsoft in the Azure Files team.
> For the past few days, I've been working on getting the Azure Linux VMs to
> join the AD domain in Azure, login as domain users, and mount Azure file
> shares over SMB3.
> 
> Most things work fine. Except that I need perform a few Kerberos related
> tasks manually, for the SMB3 mount to work with domain user credentials.
> I did some debugging of the issue, and looks like cifs.upcall (the
> userspace helper program for cifs.ko) is unable to find the krb5 TGT for
> the domain user in the cred-cache. If the cred-cache is missing, it looks
> for it in the system krb5.keytab.
> 
> Since winbind is configured with kerberos method "secrets and keytab", I
> would expect either the secrets.tdb or the krb5.keytab to have an entry for
> the domain user lxsmbadmin. Even with the domain user already logged in
> through ssh, I'm unable to get those in both those places. cred-cache file
> is not created in the first place.
> 
> With the domain user already logged in through ssh, I expected that the
> kerberos TGT would already have been retrieved and stored locally.
> Where does winbind store its Kerberos tickets, so that I can point
> cifs.upcall to look there for tickets instead?

It all depends how you configured pam_winbind. Please see pam_winbind
man page for Kerberos-related options (this outpout is from 4.11.7,
newer versions have more ccache type variants):

       krb5_auth
	   pam_winbind can authenticate using Kerberos when winbindd is
	   talking to an Active Directory domain controller. Kerberos
	   authentication must be enabled with this parameter. When
	   Kerberos authentication can not succeed (e.g. due to clock
	   skew), winbindd will fallback to samlogon authentication over
	   MSRPC. When this parameter is used in conjunction with
	   winbind refresh tickets, winbind will keep your Ticket
	   Granting Ticket (TGT) uptodate by refreshing it whenever
           necessary.

       krb5_ccache_type=[type]
	   When pam_winbind is configured to try kerberos authentication
	   by enabling the krb5_auth option, it can store the retrieved
	   Ticket Granting Ticket (TGT) in a credential cache. The type
	   of credential cache can be set with this option.  Currently
	   the only supported value is: FILE. In that case a credential
	   cache in the form of /tmp/krb5cc_UID will be created, where
	   UID is replaced with the numeric user id. Leave empty to just
	   do kerberos authentication without having a
           ticket cache after the logon has succeeded.


> 
> The mount only works when I use kinit to populate the cred-cache with the
> domain user.
> 
> Any help in troubleshooting this issue is appreciated.
> 
> Also, I'm interested to know, how can I enable the debug logs in the
> libkrb5 shared libraries that are built from the samba source code? I don't
> see the debug logs in that code being logged, even if log level is set to
> maximum in smb.conf.
> 
> Regards,
> Shyam
> 
> =======================================================
> Details of my setup:
> I'm using an Ubuntu 19.10 server VM.
> I'm mounting as the local root user, however, I'm using a domain user
> credentials for mounting the using sec=krb5.
> Below are my mount options:
> vers=3.0,sec=krb5,credentials=/home/localadmin/.smb3credentials,serverino,noperm,nosharesock,mfsymlinks,uid=lxsmbadmin,gid='domain
> users'
> 
> The VM is already joined to the AD domain aaddomain.example.com using
> winbind.
> This is what my smb.conf looks like for winbind:
> localadmin@lxsmb-canvm13:~$ cat /etc/samba/smb.conf
> [global]
>    workgroup = AADDOMAIN
>    security = ADS
>    realm = AADDOMAIN.EXAMPLE.COM
> 
>    winbind refresh tickets = Yes
>    vfs objects = acl_xattr
>    map acl inherit = Yes
>    store dos attributes = Yes
> 
>    dedicated keytab file = /etc/krb5.keytab
>    kerberos method = secrets and keytab
> 
>    winbind use default domain = Yes
> 
>    load printers = No
>    printing = bsd
>    printcap name = /dev/null
>    disable spoolss = Yes
> 
>    log file = /var/log/samba/log.%m
>    log level = 10
> 
>    idmap config * : backend = tdb
>    idmap config * : range = 3000-7999
> 
>    idmap config AADDOMAIN : backend = rid
>    idmap config AADDOMAIN : range = 10000-999999
> 
>    template shell = /bin/bash
>    template homedir = /home/%U
> 
> localadmin@lxsmb-canvm13:~$ cat /etc/krb5.conf
> [libdefaults]
>         default_realm = AADDOMAIN.EXAMPLE.COM
>         dns_lookup_realm = false
>         dns_lookup_kdc = true
> 
> Initially, I tried to use the ubuntu apt packages to install winbind and
> related packages.
> After going through a bit of code, I wanted to be able to print the debug
> logs.
> So I decided to install winbind from the latest source:
> master branch on git://git.samba.org/samba.git
> 
> Here is the configure I used to build it:
> ./configure --with-systemd --bindir=/usr/bin --sbindir=/usr/sbin
> --libdir=/usr/lib/x86_64-linux-gnu/samba --sysconfdir=/etc/samba
> --localstatedir=/run/samba --includedir=/usr/include/
> --datadir=/usr/share/samba --mandir /usr/share/man --enable-debug
> --enable-developer --systemd-install-services
> --with-systemddir=/usr/lib/systemd/system
> --with-privatedir=/var/lib/samba/private --with-systemd --with-pam
> 
> After tweaking a few config files here and there, I've now reached the same
> state as when I was running winbind from Ubuntu packages.
> I'm now able to ssh/su as the domain user to this system.
> 
> However, I do not see the cred-cache populated.
> localadmin@lxsmb-canvm13:~/samba$ sudo klist
> klist: No ticket file: /tmp/krb5cc_0
> localadmin@lxsmb-canvm13:~/samba$ ls /tmp/krb*
> ls: cannot access '/tmp/krb*': No such file or directory
> 
> After a bit of code reading of cifs.upcall, it looks to me like the
> expectation is that cred-cache would be populated for the domain user.
> If in case the cred-cache is missing, then it creates a new cred-cache from
> the keytab at /etc/krb5.keytab
> 
> So clearly, the expectation is that atleast the keytab is already
> populated.
> 
> The kerberos method that I've chosen in smb.conf is "secrets and keytab".
> So I expect either the secrets.tdb or the krb5.keytab to have an entry for
> the domain user lxsmbadmin.
> However, I do not see those entries in either of them:
> 
> localadmin@lxsmb-canvm13:~$ sudo tdbdump
> /var/lib/samba/private/secrets.tdb|grep -i lxsmbadmin
> localadmin@lxsmb-canvm13:~$
> 
> localadmin@lxsmb-canvm13:~$ sudo ktutil list|grep -i lxsmbadmin
> localadmin@lxsmb-canvm13:~$
> 
> With the domain user already logged in through ssh, I expected that the
> kerberos TGT would already have been retrieved and stored locally.
> Where would I find that?
> 
> Do note that if I populate the cred-cache manually with the kinit utility
> like so:
> localadmin@lxsmb-canvm13:~$ sudo kinit lxsmbadmin@aaddomain.example.com
> lxsmbadmin@aaddomain.example.com's Password:
> localadmin@lxsmb-canvm13:~$
> 
> The cred-cache does get populated and I'm then able to mount the file share
> successfully.
> 
> With the log level set to 10 in smb.conf, the logging in /var/log/samba/ is
> pretty verbose. I can share those if needed for further debugging.
> 
> =======================================================

-- 
/ Alexander Bokovoy

