Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AD9BA2ED0EC
	for <lists+samba-technical@lfdr.de>; Thu,  7 Jan 2021 14:38:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=bv+uYTFy+kWqMgqLENh4Wovki3zTcznBZy7f/kQEB6U=; b=sPPN25PkIJpg9Eq3Git+Ld1432
	7IPyhOpTi/X1ByoraZViwFiKRmJfkU+fLM0W2rb6cQs9s4lYuEBM0otb85aUfD1SWd9yf1qNJYD+r
	D7ytIWYgGF1f71rILGthlbUMuIRbPKvVmezqRND69eER79Xjc808P0LPuSWr50/hGkWu+F4CkE1GT
	j3b0nzECFCTjSMdkSwc6ArUIhCyu8XT16vpjIKAixvXBVEoLACZ7sO/m2TwQEHjPDhGJOYA99sUM1
	nh/04sF5l9rsrFdJuVZ1Mo0QeCHfaPRYTj+n+H490p0uooeLulS4PVGwXkAQyXeWRBeB5EaTl27bM
	zK2NFAYw==;
Received: from ip6-localhost ([::1]:36550 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kxVU5-0051tF-1I; Thu, 07 Jan 2021 13:37:49 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:22344) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kxVTu-0051t8-Ev
 for samba-technical@lists.samba.org; Thu, 07 Jan 2021 13:37:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=bv+uYTFy+kWqMgqLENh4Wovki3zTcznBZy7f/kQEB6U=; b=nikzx72Z9PA2Vp3LSkqZcpZOCU
 pOt4xU2neGdgIe8ka7N+u3iyg+dKqSmSd3/rW+z1v60ECWfhYXswsk2dKtrp4DOuLMUMoHCQeRAoQ
 euup4ZSDQG7PLtz+qSMqALZBXOVFzbQqBcHD/lsPC7M9Jw0TIcXXm0k0CWPGQqtsIv9ipFfDlHJjB
 gPXL/BZ/Ym9mfMhvXTNq2N2YyftkcTqoXdbNCfsjJvOHK/0FbMrBb05ByNbsY+enwq1VsRBYavJSx
 mCZI5K9HZBtIVpXHJyvboatHj0mYuKOIoCo7wdiHwGdH135ImDDXM4L231gPJeXd5qMK0/39rUSKI
 efUZiYmuOaD9liCs6UNIBH99l1lGfsdMTq4z2ypHOANnwGycVgWHPiX19swZ+ZrGM6zcLCnalCB7C
 +1MbK6kYNNqObNBkWNoe1IHnpJDQgcpGX/FXWgrCyv6/xm+ruuIS1rJa92c2aQ3Q/dFP4xWCYEC6b
 ef7UeMiY0+JSvtwJ0Gj8YzTk;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kxVTf-0008Cl-To
 for samba-technical@lists.samba.org; Thu, 07 Jan 2021 13:37:24 +0000
Message-ID: <2d5a7cf3b6e8e31db010f6a3d159109ca48ca998.camel@samba.org>
Subject: Re: [gssproxy] Re: cifs-utils, Linux cifs kernel client and gssproxy
To: samba-technical@lists.samba.org
Date: Thu, 07 Jan 2021 08:37:21 -0500
In-Reply-To: <e562d3fb430e4c87b0700a70267ef930@atos.net>
References: <2e241ceaece6485289b1cddb84ec77ca@atos.net>
 , <04d24a21a7a462b3dc316959c3a3b1c8be8caac3.camel@redhat.com>
 <e562d3fb430e4c87b0700a70267ef930@atos.net>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32) 
MIME-Version: 1.0
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
From: Simo via samba-technical <samba-technical@lists.samba.org>
Reply-To: Simo <simo@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, 2021-01-07 at 11:04 +0000, Weiser, Michael via samba-technical
wrote:
> Hello Simo,
> Hello Steve,
> 
> > If something is needed in the short term, I thjink the quickest
> > course
> > of action is indeed to change the userspace helper to use gssapi
> > function calls, so that they can be intercepted like we do for
> > rpc.gssd
> > (nfs client's userspace helper).
> 
> To get the ball rolling and give people (including myself and client)
> something to play with I went that route and extended cifs.upcall to
> fall back to GSS-API if no ticket cache nor keytab can be found for
> the user. An unpolished PoC patch is attached. (Sorry, for not
> putting it inline, have to rock the groupware at work. I will try to
> sort that once we've agreed this is the/a way to go.)
> 
> With that patch applied,  I can do a multiuser cifs mount using the
> system keytab and machine identity as usual and then have users
> access the mount using impersonated credentials from gssproxy. Quick
> demo:
> 
> [root@fedora33 ~]# umount /mnt
> [root@fedora33 ~]# mount -o sec=krb5,multiuser,user=FEDORA33\$
> //dc/share /mnt
> [root@fedora33 ~]# ls -la /mnt
> total 0
> drwxr-xr-x.  2 root root   0 Jan  7 10:20 .
> dr-xr-xr-x. 18 root root 238 Jan  6 13:59 ..
> -rwxr-xr-x.  1 root root   0 Jan  5 17:02 bar
> [root@fedora33 ~]# klist
> klist: Credentials cache keyring 'persistent:0:krb_ccache_WZh7W8n'
> not found
> [root@fedora33 ~]#
> 
> [adsuser@fedora33 ~]$ kdestroy
> [adsuser@fedora33 ~]$ echo test > /mnt/test
> [adsuser@fedora33 ~]$ cat /mnt/test
> test
> [adsuser@fedora33 ~]$ klist
> klist: Credentials cache keyring
> 'persistent:1618201110:krb_ccache_SrGqT3F' not found
> [adsuser@fedora33 ~]$
> 
> Server-side permissions are enforced:
> 
> [m@fedora33 ~]$ cat /mnt/test
> test
> [m@fedora33 ~]$ echo mytest > /mnt/test
> -bash: /mnt/test: Permission denied
> [m@fedora33 ~]$ klist
> klist: Credentials cache keyring 'persistent:1000:1000' not found
> [m@fedora33 ~]$
> 
> The gssproxy config for this configures a cifs-specific socket and
> enables impersonation for any user id:
> 
> [root@fedora33 ~]# cat /etc/gssproxy/99-cifs.conf
> [service/cifs]
> mechs = krb5
> socket = /var/lib/gssproxy/cifs.sock
> cred_store = keytab:/etc/krb5.keytab
> cred_usage = initiate
> euid = 0
> impersonate = yes
> allow_any_uid = yes
> 
> And request-key config for cifs.spnego enables use of gssproxy and
> the service-specific socket through environment variables:
> 
> [root@fedora33 ~]# cat /etc/request-key.d/cifs.spnego.conf
> create  cifs.spnego    * *  /usr/bin/env GSS_USE_PROXY=yes
> GSSPROXY_SOCKET=/var/lib/gssproxy/cifs.sock /usr/sbin/cifs.upcall %k
> 
> (I see that nfs-utils' gssd does the same by setting the variables
> itself based on command line options. That could easily be done here
> as well.)
>  
> User FEDORA33$ (the computer object) needs to be enabled for
> delegation to service cifs. I've tested with a Fedora 33 client and
> Windows 2016 Active Directory server.
> 
> The patch is against current cifs-utils HEAD. It is lacking all the
> autoconf trimmings and intentionally forgoes reindents of existing
> code for clarity of what's being touched.
> 
> What do you think?

Sounds great!

> > Unfortunately I do not have the cycles to work on that myself at
> > this
> > time :-(
> 
> I have a client in very tangible need of this functionality who is a
> RedHat customer. Would it be helpful if they were to open a case with
> Redhat on this?

Yes!
CC me if you need to.

> As an extension the above (but not to distract from the focus of
> getting something to work at all first):
> 
> I rather accidentally also played around with delegating retrieval of
> the mount credentials into gssproxy as well (due to not realising
> that username=FEDORA33$ would just activate the keytab codepath in
> cifs.upcall).
> 
> This can be done by leaving out the username from the mount command,
> marking euid 0 as trusted for access to the keytab in gssproxy and
> adding a fallback principal to the gssproxy config (because
> cifs.upcall in this case does not submit a desired name for the
> credential):
> 
> [root@fedora33 ~]# mount -o sec=krb5,multiuser //dc/share /mnt
> [root@fedora33 ~]# cat /etc/gssproxy/99-cifs.conf
> [service/cifs]
> mechs = krb5
> socket = /var/lib/gssproxy/cifs.sock
> cred_store = keytab:/etc/krb5.keytab
> cred_usage = initiate
> euid = 0
> trusted = yes
> impersonate = yes
> krb5_principal = cifs-mount
> allow_any_uid = yes
> 
> While this works, it requires a separate user who would then
> carefully need to be kept out of any sensitive file access groups.
> 
> When trying to use the machine identity FEDORA33$ instead, I ran into
> a peculiar error from the AD KDC:
> 
> [root@fedora33 ~]# cat /etc/gssproxy/99-cifs.conf
> [service/cifs]
> mechs = krb5
> socket = /var/lib/gssproxy/cifs.sock
> cred_store = keytab:/etc/krb5.keytab
> cred_usage = initiate
> euid = 0
> trusted = yes
> impersonate = yes
> krb5_principal = FEDORA33$
> allow_any_uid = yes
> [root@fedora33 ~]# gssproxy -i -d &
> [2] 3814
> [root@fedora33 ~]# [2021/01/07 10:01:10]: Debug Enabled (level: 1)
> [2021/01/07 10:01:10]: Service: nfs-server, Keytab: /etc/krb5.keytab,
> Enctype: 17
> [2021/01/07 10:01:10]: Service: cifs, Keytab: /etc/krb5.keytab,
> Enctype: 17
> [2021/01/07 10:01:10]: Service: nfs-client, Keytab: /etc/krb5.keytab,
> Enctype: 17
> [2021/01/07 10:01:10]: Client [2021/01/07 10:01:10]:
> (/usr/sbin/gssproxy) [2021/01/07 10:01:10]:  connected (fd =
> 11)[2021/01/07 10:01:10]:  (pid = 3814) (uid = 0) (gid =
> 0)[2021/01/07 10:01:10]:  (context =
> system_u:system_r:kernel_t:s0)[2021/01/07 10:01:10]:
> 
> [root@fedora33 ~]# mount -o sec=krb5,multiuser //dc/share /mnt
> [2021/01/07 10:01:13]: Client [2021/01/07 10:01:13]:
> (/usr/sbin/cifs.upcall) [2021/01/07 10:01:13]:  connected (fd =
> 12)[2021/01/07 10:01:13]:  (pid = 3824) (uid = 0) (gid =
> 0)[2021/01/07 10:01:13]:  (context =
> system_u:system_r:kernel_t:s0)[2021/01/07 10:01:13]:
> [CID 12][2021/01/07 10:01:13]: gp_rpc_execute: executing 6
> (GSSX_ACQUIRE_CRED) for service "cifs", euid: 0,socket:
> /var/lib/gssproxy/cifs.sock
> gssproxy[3814]: (OID: { 1 2 840 113554 1 2 2 }) Unspecified GSS
> failure.  Minor code may provide more information, KDC has no support
> for padata type
> [CID 12][2021/01/07 10:01:13]: gp_rpc_execute: executing 8
> (GSSX_INIT_SEC_CONTEXT) for service "cifs", euid: 0,socket:
> /var/lib/gssproxy/cifs.sock
> gssproxy[3814]: (OID: { 1 2 840 113554 1 2 2 }) Unspecified GSS
> failure.  Minor code may provide more information, KDC has no support
> for padata type
> [CID 12][2021/01/07 10:01:13]: gp_rpc_execute: executing 6
> (GSSX_ACQUIRE_CRED) for service "cifs", euid: 0,socket:
> /var/lib/gssproxy/cifs.sock
> gssproxy[3814]: (OID: { 1 2 840 113554 1 2 2 }) Unspecified GSS
> failure.  Minor code may provide more information, KDC has no support
> for padata type
> [CID 12][2021/01/07 10:01:13]: gp_rpc_execute: executing 8
> (GSSX_INIT_SEC_CONTEXT) for service "cifs", euid: 0,socket:
> /var/lib/gssproxy/cifs.sock
> gssproxy[3814]: (OID: { 1 2 840 113554 1 2 2 }) Unspecified GSS
> failure.  Minor code may provide more information, KDC has no support
> for padata type
> mount error(126): Required key not available
> Refer to the mount.cifs(8) manual page (e.g. man mount.cifs) and
> kernel log messages (dmesg)
> 
> With more debugging it appears that gssproxy tries to impersonate
> user FEDORA33$ with a credential which is also for FEDORA33$. After
> further testing it seems this is generally not allowed or just not
> working due to never being tested because it is unnecessary: If we
> can acquire a impersonation credential for that identity we should
> also be able to get the actual access credential as well.

Sounds like a bug in gss-proxy, can you file a github issue/PR ?
We should certainly shortcut the impersonation if we already have a
valid credential.

> From looking at the nfs-utils gssd code it appears the only reason it
> hasn't run into this case yet is because it handles the machine
> credentials itself using krb5 functions.
> 
> The second attached patch against current gssproxy HEAD adds that
> distinction and makes this case work as an optional extension with
> fallback into the default codepath on error.
> 
> Does that make sense?

Yes the patch looks good!

> Is it sane, security wise, do you think?

Sane, you are just avoiding a useless call in a special case.

Simo.


