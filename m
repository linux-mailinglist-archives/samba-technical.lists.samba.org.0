Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A8B35E9D4
	for <lists+samba-technical@lfdr.de>; Wed, 14 Apr 2021 01:55:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=UDYU/Hrqo3RPLb0Kpsvjq0hzVvcsGXhAcl2HhywbRYQ=; b=5Q2Z1yJNHjRp49AxzTIuTcUYQM
	fmWCtvOT+fB+OvxQVOuWbvNxs1+gmVauFWFx+RkaH2tU/taz8j+XW0mRCAvPWI13AQckAb28+VXs8
	N6W1/xJUWQRTozpc8AwBL33Jf0t3E1G6OWhJwVNhFH8Xey9xYVN5q5ArAH0NMeIIhviw4wWCzIHSB
	XTZ1PSsuSe2xpdKDYRFJuJJcupJ5i5RR5Ibhv5cM3tkpbYRCvgw1tFjvIshse1e8rWyDDiPYHryOu
	OLpZimGutSlabS3g8EyLuR4P84fxNspoOhSoPvzirwWXb2YK/YeWtHUya4XCWt3aziM8f328bN/bD
	CdNGU45Q==;
Received: from ip6-localhost ([::1]:56034 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lWSr9-00BCeK-Va; Tue, 13 Apr 2021 23:54:08 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:42619) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lWSqy-00BCeD-1d
 for samba-technical@lists.samba.org; Tue, 13 Apr 2021 23:54:04 +0000
Received: by mail-ej1-x629.google.com with SMTP id w23so12796725ejb.9
 for <samba-technical@lists.samba.org>; Tue, 13 Apr 2021 16:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=UDYU/Hrqo3RPLb0Kpsvjq0hzVvcsGXhAcl2HhywbRYQ=;
 b=gt7k+xAqak0GHxUD19xLkF3yWaW6GslGfHRzx/ECjvw3lP5IkCy/4jpXJGQF44DJso
 6AxqwZEP3mFX6tR3Xy4vyCWuU5tJJHRaHd/46DOBiIMxCIqeFK9nY20AuPfZJ7JDTZ3D
 yyNJYUIB1apoPw4x4upXv9rP/QI+7roKgqSFwzJrbEnS2UeFcgatjT0DPhNSrnJ0mhJ1
 NX1cxJB8DMPeWZqZV9ZcFoZsYR2khmF5RtTmNpLQzu2fczwjSsyU0Uq4kYTpXj2I9ZlC
 TF3fRASzxKeqcx8V6PdvYG8RpEqBZBTt+a0QDgZNemCs2Q+EURqZ8FOLXbPF+1rKQbuO
 P2Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=UDYU/Hrqo3RPLb0Kpsvjq0hzVvcsGXhAcl2HhywbRYQ=;
 b=P/W8hbVg8mLPxY46LnG8CG3wrroncfKa2Cvjbg66M7pqLv39yHaZwecB2Z3y9EvVG4
 y1Qh37b9UyizRUfYPN9DYptBMn6a4yQGtV5awLjSecMM1cp0OfZ/87n12ODo1QTDGCl2
 iPA/0u/lJOeyvLUDEo0pHOMSg5+rCOCEV0AtkPTq31u8P/7GytZHzK0Gv+iqgQiQGA6Y
 DzUs7SsNKkOwjcKGk5zsBxwWV/lP9Ejf8SIO0kOlm70TOmRcq160YMhaRCKwVW0yV36e
 cvxC1MMfwaML5GAzjyerWdA8oBLd39F8ceYOXYBpT6H1Z+VlQBqelMi0PKHSPvvOWz/o
 2G0g==
X-Gm-Message-State: AOAM530cxTEfmuRSiyeghM/b/Cptu1b+P7k6NVkzfXsEq0pvE51CF0Fb
 FsGmw8pST0xnzbu8V3QVAb1bazwJ0Z/SwTY/At8=
X-Google-Smtp-Source: ABdhPJxv29sykkTIxLStIqYYiqa02JOpMYQgkBCXY5mmRFvnOuWbi6GtlC3b2rGzTsmn8RQT+Zux7GnWXNK3+6dPceY=
X-Received: by 2002:a17:906:4746:: with SMTP id
 j6mr23499350ejs.39.1618358034622; 
 Tue, 13 Apr 2021 16:53:54 -0700 (PDT)
MIME-Version: 1.0
References: <2e241ceaece6485289b1cddb84ec77ca@atos.net>
 <04d24a21a7a462b3dc316959c3a3b1c8be8caac3.camel@redhat.com>
 <CAH2r5mt9r6nWop_ekbe1CsinztUiGhP2-bxWFkRqHXOP=MXcVQ@mail.gmail.com>
 <c49c0a18c228e6aa43dbb2cbab7e0a266d1c0371.camel@redhat.com>
 <CANT5p=p_G+jMMVMkYDL=fXZi_OO7eY2Foz8VkyQuT+1h5Xgifw@mail.gmail.com>
 <facbd0542074a5b8ef2f6f3d5649010503d8d84d.camel@redhat.com>
 <CALe0_75RLR=gcwitnxvACh1mt3jnOGHFx7baO0YRhwEfKwFoGg@mail.gmail.com>
 <545cee6aeefcb9cc51463532a62e96a9296def18.camel@redhat.com>
 <CALe0_77EUgJ7PRpkAMxy1ar-MtGCUPSNbE2wTSFhQBYAb9XPbQ@mail.gmail.com>
 <2fbe6900ae8354b0ac3c60c2eeaeed6e28b27fd8.camel@redhat.com>
In-Reply-To: <2fbe6900ae8354b0ac3c60c2eeaeed6e28b27fd8.camel@redhat.com>
Date: Wed, 14 Apr 2021 09:53:42 +1000
Message-ID: <CAN05THRsOHnBZRLFhmTKv5V-6sTun7oQeX7tMUjMPnTpQ9DN=Q@mail.gmail.com>
Subject: Re: [gssproxy] cifs-utils, Linux cifs kernel client and gssproxy
To: Simo Sorce <simo@redhat.com>
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
From: ronnie sahlberg via samba-technical <samba-technical@lists.samba.org>
Reply-To: ronnie sahlberg <ronniesahlberg@gmail.com>
Cc: Shyam Prasad N <nspmangalore@gmail.com>,
 "linux-cifs@vger.kernel.org" <linux-cifs@vger.kernel.org>,
 The GSS-Proxy developers and users mailing list
 <gss-proxy@lists.fedorahosted.org>, Jacob Shivers <jshivers@redhat.com>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>,
 Steve French <smfrench@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Pavel,

What is the status of this patch and getting it into cifs-utils?
The are reported to work in tests by some folks and they do provide
desired new functionality.


regards
ronnie sahlberg

On Sat, Mar 6, 2021 at 8:20 AM Simo Sorce <simo@redhat.com> wrote:
>
> On Fri, 2021-03-05 at 16:29 -0500, Jacob Shivers wrote:
> > if nfs-client is to be used as well as cifs-client, then wouldn't a
> > different socket be required? Testing with cifs-client using the same
> > socket returns an error from gssproxy:
> >
> > "cifs sets allow_any_uid with the same socket, selinux_context, and
> > program as nfs-client!".
>
> The point is that you do not need a separate service definition if you
> are configuring them the same way :-)
> If you want different configurations but same access pattern, then yeah
> different sockets help. So it is just a metter of figuring out what
> works best.
>
> > Leveraging the built-in functionality of gssproxy is preferable as
> > that addresses use cases where the process was started manually and
> > not via systemd. Would it be reasonable to ever add gid filtering to
> > gssproxy? I ask as that would allow for a group of batch
> > processes/applications to have access where say applications could be
> > added to a fixed group name/gid but, different uids may be deployed
> > over time as different applications are used.
>
> Yes I think adding gid filtering is a feature I find useful, feel free
> to open an issue describing the semantics you think would make more
> sense for your use case. Implementation is not hard, but nailing the
> semantics is important.
>
> Simo.
>
> > On Tue, Feb 23, 2021 at 2:54 PM Simo Sorce <simo@redhat.com> wrote:
> > > Nice work!
> > >
> > > Notice that GSS-Proxy can already perform access control, so you do n=
ot
> > > have to create additional sockets or the systemd script, but you can
> > > simply create service files in gssproxy that filter based on uid or
> > > even SELinux context if you like.
> > >
> > > There are additional filters based on the calling program too, but
> > > those are not to be used to enforce security measures as argv[0] is
> > > under the control of the user.
> > >
> > > HTH,
> > > Simo.
> > >
> > > On Tue, 2021-02-23 at 12:42 -0500, Jacob Shivers wrote:
> > > > I have tested the patches for cifs.upcall and can say that with som=
e
> > > > additional modifications to gssproxy the end setup brings a degree =
of
> > > > feature parity to SMB clients that had been previously exclusive to
> > > > NFS clients.
> > > > Deployment does require some additional configuration, including th=
e
> > > > creation of a drop-in file for gssproxy under /etc/gssproxy and for
> > > > the gssproxy service managed by systemd
> > > >
> > > >
> > > > ### KDC configuration
> > > >
> > > >  *** delegation ***
> > > >
> > > > Constrained Delegation (CD) for the SMB host to the Kerberized SMB =
server
> > > > Resource Based Constrained Delegation (RBCD) on the Kerberized SMB
> > > > server to determine which SMB clients can delegate
> > > >
> > > >
> > > > ### SMB client configuration
> > > >
> > > >  *** sssd ***
> > > >
> > > >  Configuration file modification.
> > > >
> > > > Disable using fully qualified domain names as impersonation does no=
t
> > > > correctly handle fully qualified names at time of ticket acquisitio=
n.
> > > >
> > > > use_fully_qualified_names =3D False
> > > >
> > > >  *** gssproxy ***
> > > >
> > > >  Drop file creation
> > > >
> > > > Add a drop file for gssproxy to create the necessary socket and
> > > > corresponding settings.
> > > >
> > > > # cat /etc/gssproxy/99-cifs-client.conf with contents
> > > > [service/cifs]
> > > > mechs =3D krb5
> > > > socket =3D /var/lib/gssproxy/cifs.sock
> > > > cred_store =3D keytab:/etc/krb5.keytab
> > > > cred_usage =3D initiate
> > > > euid =3D 0
> > > > impersonate =3D yes
> > > > allow_any_uid =3D yes
> > > >
> > > >  Service drop-in file.
> > > >
> > > > Create a drop-in file to limit socket access for an unattended user=
, if desired.
> > > >
> > > > # cat /etc/systemd/system/gssproxy.service.d/90-cifs.conf
> > > > [Service]
> > > > # Limit cifs.sock socket file accessiblility to just the unattended=
 user.
> > > > ExecStartPost=3D/bin/bash -c 'chmod 660 /var/lib/gssproxy/cifs.sock=
 &&
> > > > setfacl -m u:chang:rw /var/lib/gssproxy/cifs.sock'
> > > >
> > > >
> > > >  *** cifs.upcall ***
> > > >
> > > >  cifs.spnego.conf modification
> > > >
> > > > Allow for gssprxy to be used and specify socket file
> > > >
> > > > # cat /etc/request-key.d/cifs.spnego.conf
> > > > create  cifs.spnego    * *  /usr/bin/env GSS_USE_PROXY=3Dyes
> > > > GSSPROXY_SOCKET=3D/var/lib/gssproxy/cifs.sock /usr/sbin/cifs.upcall=
 %k
> > > >
> > > >    include the '-t' flag to allow for accessing a Kerberized DFS
> > > > namespace using a domain based mount, i.e //example.net/dfs/share
> > > >
> > > > create  cifs.spnego    * *  /usr/bin/env GSS_USE_PROXY=3Dyes
> > > > GSSPROXY_SOCKET=3D/var/lib/gssproxy/cifs.sock /usr/sbin/cifs.upcall=
 -t
> > > > %k
> > > >
> > > >
> > > > The above does allow for unattended users to access a Kerberized SM=
B
> > > > share while limiting access to only a specific user:
> > > >
> > > > # mount //win2k16-dfs1.example.net/greendale/ /mnt -o
> > > > sec=3Dkrb5,username=3D'TEST-BOX$@EXAMPLE.NET',multiuser
> > > >
> > > > # su - jeff
> > > > Last login: Fri Feb  5 12:14:42 EST 2021 on pts/0
> > > > [jeff@test-box ~]$ ll /mnt
> > > > ls: cannot access '/mnt': Permission denied
> > > > [jeff@test-box ~]$ logout
> > > >
> > > > # su - chang
> > > > Last login: Fri Feb  5 12:14:46 EST 2021 on pts/0
> > > > [chang@test-box ~]$ klist
> > > > klist: No credentials cache found (filename: /tmp/krb5cc_602001123)
> > > > [chang@test-box ~]$ ls -l /mnt
> > > > total 143
> > > >
> > > > drwxr-xr-x. 2 chang domain users      0 Oct  4  2018  DfsrPrivate
> > > > -rwxr-xr-x. 1 chang domain users      0 Sep 22 10:07  test_file
> > > > -rwxr-xr-x. 1 chang domain users      0 Dec 14 15:22  whoami
> > > > drwxr-xr-x. 2 chang domain users      0 Dec  7 12:54  winhome
> > > >
> > > > [chang@test-box ~]$ klist
> > > > klist: No credentials cache found (filename: /tmp/krb5cc_602001123)
> > > >
> > > >
> > > > Feb 23 12:22:44.857956 test-box.example.net su[1672]: (to jeff) roo=
t on pts/1
> > > > Feb 23 12:22:44.866263 test-box.example.net su[1672]:
> > > > pam_systemd(su-l:session): Cannot create session: Already running i=
n a
> > > > session or user slice
> > > > Feb 23 12:22:44.867158 test-box.example.net su[1672]:
> > > > pam_unix(su-l:session): session opened for user jeff by root(uid=3D=
0)
> > > > Feb 23 12:22:46.253310 test-box.example.net cifs.upcall[1700]: key
> > > > description: cifs.spnego;0;0;39010000;ver=3D0x2;host=3Dwin2k16-dfs1=
.example.net;ip4=3D192.168.124.132;sec=3Dkrb5;uid=3D0x23e1cedc;creduid=3D0x=
23e1cedc;pid=3D0x6a3
> > > > Feb 23 12:22:46.253335 test-box.example.net cifs.upcall[1700]: ver=
=3D2
> > > > Feb 23 12:22:46.253338 test-box.example.net cifs.upcall[1700]:
> > > > host=3Dwin2k16-dfs1.example.net
> > > > Feb 23 12:22:46.253342 test-box.example.net cifs.upcall[1700]:
> > > > ip=3D192.168.124.132
> > > > Feb 23 12:22:46.253344 test-box.example.net cifs.upcall[1700]: sec=
=3D1
> > > > Feb 23 12:22:46.253348 test-box.example.net cifs.upcall[1700]: uid=
=3D602001116
> > > > Feb 23 12:22:46.253352 test-box.example.net cifs.upcall[1700]: cred=
uid=3D602001116
> > > > Feb 23 12:22:46.253365 test-box.example.net cifs.upcall[1700]: pid=
=3D1699
> > > > Feb 23 12:22:46.253978 test-box.example.net cifs.upcall[1700]:
> > > > get_cachename_from_process_env: pathname=3D/proc/1699/environ
> > > > Feb 23 12:22:46.254995 test-box.example.net cifs.upcall[1700]:
> > > > get_existing_cc: default ccache is FILE:/tmp/krb5cc_602001116
> > > > Feb 23 12:22:46.255015 test-box.example.net cifs.upcall[1700]:
> > > > get_tgt_time: unable to get principal
> > > > Feb 23 12:22:46.255021 test-box.example.net cifs.upcall[1700]:
> > > > handle_krb5_mech: getting service ticket for win2k16-dfs1.example.n=
et
> > > > Feb 23 12:22:46.255024 test-box.example.net cifs.upcall[1700]:
> > > > handle_krb5_mech: using GSS-API
> > > > Feb 23 12:22:46.259295 test-box.example.net cifs.upcall[1700]: GSS-=
API
> > > > error init_sec_context: Unspecified GSS failure.  Minor code may
> > > > provide more information
> > > > Feb 23 12:22:46.259306 test-box.example.net cifs.upcall[1700]: GSS-=
API
> > > > error init_sec_context: No Kerberos credentials available (default
> > > > cache: FILE:/tmp/krb5cc_602001116)
> > > > Feb 23 12:22:46.259311 test-box.example.net cifs.upcall[1700]:
> > > > handle_krb5_mech: failed to obtain service ticket via GSS (851968)
> > > > Feb 23 12:22:46.259314 test-box.example.net cifs.upcall[1700]: Unab=
le
> > > > to obtain service ticket
> > > > Feb 23 12:22:46.259323 test-box.example.net cifs.upcall[1700]: Exit
> > > > status 851968
> > > > Feb 23 12:22:46.262827 test-box.example.net kernel: CIFS VFS:
> > > > \\win2k16-dfs1.example.net Send error in SessSetup =3D -126
> > > > Feb 23 12:22:47.398266 test-box.example.net su[1672]:
> > > > pam_unix(su-l:session): session closed for user jeff
> > > > Feb 23 12:22:49.159640 test-box.example.net su[1702]: (to chang) ro=
ot on pts/1
> > > > Feb 23 12:22:49.173264 test-box.example.net su[1702]:
> > > > pam_systemd(su-l:session): Cannot create session: Already running i=
n a
> > > > session or user slice
> > > > Feb 23 12:22:49.173967 test-box.example.net su[1702]:
> > > > pam_unix(su-l:session): session opened for user chang by root(uid=
=3D0)
> > > > Feb 23 12:22:51.878743 test-box.example.net cifs.upcall[1729]: key
> > > > description: cifs.spnego;0;0;39010000;ver=3D0x2;host=3Dwin2k16-dfs1=
.example.net;ip4=3D192.168.124.132;sec=3Dkrb5;uid=3D0x23e1cee3;creduid=3D0x=
23e1cee3;pid=3D0x6c0
> > > > Feb 23 12:22:51.878765 test-box.example.net cifs.upcall[1729]: ver=
=3D2
> > > > Feb 23 12:22:51.878769 test-box.example.net cifs.upcall[1729]:
> > > > host=3Dwin2k16-dfs1.example.net
> > > > Feb 23 12:22:51.878773 test-box.example.net cifs.upcall[1729]:
> > > > ip=3D192.168.124.132
> > > > Feb 23 12:22:51.878776 test-box.example.net cifs.upcall[1729]: sec=
=3D1
> > > > Feb 23 12:22:51.878780 test-box.example.net cifs.upcall[1729]: uid=
=3D602001123
> > > > Feb 23 12:22:51.878783 test-box.example.net cifs.upcall[1729]: cred=
uid=3D602001123
> > > > Feb 23 12:22:51.878786 test-box.example.net cifs.upcall[1729]: pid=
=3D1728
> > > > Feb 23 12:22:51.879060 test-box.example.net cifs.upcall[1729]:
> > > > get_cachename_from_process_env: pathname=3D/proc/1728/environ
> > > > Feb 23 12:22:51.879799 test-box.example.net cifs.upcall[1729]:
> > > > get_existing_cc: default ccache is FILE:/tmp/krb5cc_602001123
> > > > Feb 23 12:22:51.879819 test-box.example.net cifs.upcall[1729]:
> > > > get_tgt_time: unable to get principal
> > > > Feb 23 12:22:51.879824 test-box.example.net cifs.upcall[1729]:
> > > > handle_krb5_mech: getting service ticket for win2k16-dfs1.example.n=
et
> > > > Feb 23 12:22:51.879827 test-box.example.net cifs.upcall[1729]:
> > > > handle_krb5_mech: using GSS-API
> > > > Feb 23 12:22:51.886573 test-box.example.net gssproxy[1000]:
> > > > [2021/02/23 17:22:51]: Client [2021/02/23 17:22:51]:
> > > > (/usr/sbin/cifs.upcall) [2021/02/23 17:22:51]:  connected (fd =3D
> > > > 14)[2021/02/23 17:22:51]:  (pid =3D 1729) (uid =3D 602001123) (gid =
=3D
> > > > 602000513)[2021/02/23 17:22:51]:  (context =3D
> > > > system_u:system_r:kernel_t:s0)[>
> > > > Feb 23 12:22:51.886573 test-box.example.net gssproxy[1000]: [CID
> > > > 14][2021/02/23 17:22:51]: Connection matched service cifs
> > > > Feb 23 12:22:51.886573 test-box.example.net gssproxy[1000]: [CID
> > > > 14][2021/02/23 17:22:51]: gp_rpc_execute: executing 6
> > > > (GSSX_ACQUIRE_CRED) for service "cifs", euid: 602001123,socket:
> > > > /var/lib/gssproxy/cifs.sock
> > > > Feb 23 12:22:51.886573 test-box.example.net gssproxy[1000]:
> > > > GSSX_ARG_ACQUIRE_CRED( call_ctx: { "" [  ] } input_cred_handle: <Nu=
ll>
> > > > add_cred: 0 desired_name: <Null> time_req: 0 desired_mechs: { }
> > > > cred_usage: INITIATE initiator_time_req: 0 acceptor_time_req: 0 )
> > > > Feb 23 12:22:52.346639 test-box.example.net gssproxy[1000]:
> > > > GSSX_RES_ACQUIRE_CRED( status: { 0 { 1 2 840 113554 1 2 2 } 0 "" ""=
 [
> > > > ] } output_cred_handle: { "chang@EXAMPLE.NET" [ { "chang@EXAMPLE.NE=
T"
> > > > { 1 2 840 113554 1 2 2 } INITIATE 36000 0 } ] [ K.....T.....pJv....=
 ]
> > > > 0 } )
> > > > Feb 23 12:22:52.348086 test-box.example.net gssproxy[1000]: [CID
> > > > 14][2021/02/23 17:22:52]: Connection matched service cifs
> > > > Feb 23 12:22:52.348086 test-box.example.net gssproxy[1000]: [CID
> > > > 14][2021/02/23 17:22:52]: gp_rpc_execute: executing 8
> > > > (GSSX_INIT_SEC_CONTEXT) for service "cifs", euid: 602001123,socket:
> > > > /var/lib/gssproxy/cifs.sock
> > > > Feb 23 12:22:52.348086 test-box.example.net gssproxy[1000]:
> > > > GSSX_ARG_INIT_SEC_CONTEXT( call_ctx: { "" [  ] } context_handle:
> > > > <Null> cred_handle: { "chang@EXAMPLE.NET" [ { "chang@EXAMPLE.NET" {=
 1
> > > > 2 840 113554 1 2 2 } INITIATE 36000 0 } ] [ K.....T.....pJv.... ] 0=
 }
> > > > target_name: "cifs@win2k16-dfs1.example.net" mech>
> > > > Feb 23 12:22:52.348086 test-box.example.net gssproxy[1000]: [CID
> > > > 14][2021/02/23 17:22:52]: Credentials allowed by configuration
> > > > Feb 23 12:22:52.357103 test-box.example.net gssproxy[1000]:
> > > > GSSX_RES_INIT_SEC_CONTEXT( status: { 0 { 1 2 840 113554 1 2 2 } 0 "=
"
> > > > "" [  ] } context_handle: { [ ......H............ ] [  ] 0 { 1 2 84=
0
> > > > 113554 1 2 2 } "chang@EXAMPLE.NET"
> > > > "cifs/win2k16-dfs1.example.net@EXAMPLE.NET" 36000 432 1 1 }
> > > > output_token: [ .....>
> > > > Feb 23 12:22:52.357419 test-box.example.net cifs.upcall[1729]: Exit=
 status 0
> > > >
> > > >
> > > > Ultimately a helper-script packaged with cifs-utils or a separate
> > > > package entirely could be responsible for adding the file under
> > > > /etc/gssproxy and the drop-in file for systemd. The helper script
> > > > could take a series of users/groups as arguments that would limit
> > > > access to the socket file or there could be a separate config file
> > > > that is read from to determine if access to the cifs.sock socket
> > > > should be limited.
> > > >
> > > >
> > > > On Fri, Feb 19, 2021 at 12:38 PM Simo Sorce <simo@redhat.com> wrote=
:
> > > > > On Fri, 2021-02-19 at 03:30 -0800, Shyam Prasad N wrote:
> > > > > > Hi Simo,
> > > > > >
> > > > > > > Finally the GSS-Proxy mechanism is namespace compatible, so y=
ou also
> > > > > > > get the ability to define different auth daemons per differen=
t
> > > > > > > containers, no need to invent new mechanisms for that or chan=
ge yet
> > > > > > > again protocols/userspace to obtain container capabilities.
> > > > > >
> > > > > > Could you please point me to the documentation for doing this?
> > > > >
> > > > > I do not know if the kernel documents this, but the way gssproxy =
works
> > > > > is that when you start the daemon it pokes at the kernel to let i=
t know
> > > > > the socket is available. So then the kernel opens the socket in t=
he
> > > > > namespace the proxy is running into (detected from the poking
> > > > > operation, which is a write in a proc file).
> > > > >
> > > > > HTH,
> > > > > Simo.
> > > > >
> > > > > > Regards,
> > > > > > Shyam
> > > > > >
> > > > > > On Thu, Dec 17, 2020 at 5:41 AM Simo Sorce <simo@redhat.com> wr=
ote:
> > > > > > > Hi Steve,
> > > > > > >
> > > > > > > GSSAPI and krb5 as implemented in system krb5 libraries exist=
s from
> > > > > > > longer than Samba has implemented those capabilities, I do no=
t think it
> > > > > > > make sense to reason along those lines.
> > > > > > >
> > > > > > > GSS-Proxy has been built with a protocol to talk from the ker=
nel that
> > > > > > > resolved a number of issues for knfsd (eg big packet sizes wh=
en a MS-
> > > > > > > PAC is present).
> > > > > > >
> > > > > > > And Samba uses internally exactly the same krb5 mechanism as =
it defers
> > > > > > > to the kerberos libraries as well.
> > > > > > >
> > > > > > > Additionally GSS-Proxy can be very easily extended to also do=
 NTLMSSP
> > > > > > > using the same interface as I have built the gssntlmssp long =
ago from
> > > > > > > the MS spec, and is probably the most correct NTLMSSP impleme=
ntation
> > > > > > > you can find around.
> > > > > > >
> > > > > > > Gssntlmssp also has a Winbind backend so you get automaticaly=
 access to
> > > > > > > whatever cached credentials Winbindd has for users as a bonus=
 (although
> > > > > > > the integration can be improved there), yet you *can* use it =
w/o
> > > > > > > Winbindd just fine providing a credential file (smbpasswd for=
mat
> > > > > > > compatible).
> > > > > > >
> > > > > > > GSS-Proxy is already integrated in distributions because it i=
s used by
> > > > > > > knfsd, and can be as easily used by cifsd, and you *should* r=
eally use
> > > > > > > it there, so we can have a single, consistent, maintained, me=
chanism
> > > > > > > for server side GSS authentication, and not have to repeat an=
d reinvent
> > > > > > > kernel to userspace mechanisms.
> > > > > > >
> > > > > > > And if you add it for cifsd you have yet another reason to do=
 it for
> > > > > > > cifs.ko as well.
> > > > > > >
> > > > > > > Finally the GSS-Proxy mechanism is namespace compatible, so y=
ou also
> > > > > > > get the ability to define different auth daemons per differen=
t
> > > > > > > containers, no need to invent new mechanisms for that or chan=
ge yet
> > > > > > > again protocols/userspace to obtain container capabilities.
> > > > > > >
> > > > > > > For the client we'll need to add some XDR parsing functions i=
n kernel,
> > > > > > > they were omitted from my original patches because there was =
no client
> > > > > > > side kernel consumer back then, but it i an easy, mechanical =
change.
> > > > > > >
> > > > > > > HTH,
> > > > > > > Simo.
> > > > > > >
> > > > > > > On Wed, 2020-12-16 at 16:43 -0600, Steve French wrote:
> > > > > > > > generally I would feel more comfortable using something (li=
brary or
> > > > > > > > utility) in Samba (if needed) for additional SPNEGO support=
 if
> > > > > > > > something is missing (in what the kernel drivers are doing =
to
> > > > > > > > encapsulate Active Directory or Samba AD krb5 tickets in SP=
NEGO) as
> > > > > > > > Samba is better maintained/tested etc. than most components=
.  Is there
> > > > > > > > something in Samba that could be used here instead of havin=
g a
> > > > > > > > dependency on another project - Samba has been doing Kerber=
os/SPNEGO
> > > > > > > > longer than most ...?   There are probably others (jra, Met=
ze etc.)
> > > > > > > > that have would know more about gssproxy vs. Samba equivale=
nts though
> > > > > > > > and would defer to them ...
> > > > > > > >
> > > > > > > > On Wed, Dec 16, 2020 at 8:33 AM Simo Sorce <simo@redhat.com=
> wrote:
> > > > > > > > > Hi Michael,
> > > > > > > > > as you say the best course of action would be for cifs.ko=
 to move to
> > > > > > > > > use the RPC interface we defined for knfsd (with any exte=
nsions that
> > > > > > > > > may  be needed), and we had discussions in the past with =
cifs upstream
> > > > > > > > > developers about it. But nothing really materialized.
> > > > > > > > >
> > > > > > > > > If something is needed in the short term, I thjink the qu=
ickest course
> > > > > > > > > of action is indeed to change the userspace helper to use=
 gssapi
> > > > > > > > > function calls, so that they can be intercepted like we d=
o for rpc.gssd
> > > > > > > > > (nfs client's userspace helper).
> > > > > > > > >
> > > > > > > > > Unfortunately I do not have the cycles to work on that my=
self at this
> > > > > > > > > time :-(
> > > > > > > > >
> > > > > > > > > HTH,
> > > > > > > > > Simo.
> > > > > > > > >
> > > > > > > > > On Wed, 2020-12-16 at 10:01 +0000, Weiser, Michael wrote:
> > > > > > > > > > Hello,
> > > > > > > > > >
> > > > > > > > > > I have a use-case for authentication of Linux cifs clie=
nt mounts without the user being present (e.g. from batch jobs) using gsspr=
oxy's impersonation feature with Kerberos Constrained Delegation similar to=
 how it can be done for NFS[1].
> > > > > > > > > >
> > > > > > > > > > My understanding is that currently neither the Linux ci=
fs kernel client nor cifs-utils userland tools support acquiring credential=
s using gssproxy. The former uses a custom upcall interface to talk to cifs=
.spnego from cifs-utils. The latter then goes looking for Kerberos ticket c=
aches using libkrb5 functions, not GSSAPI, which prevents gssproxy from int=
eracting with it.[2]
> > > > > > > > > >
> > > > > > > > > > From what I understand, the preferred method would be t=
o switch the Linux kernel client upcall to the RPC protocol defined by gssp=
roxy[3] (as has been done for the Linux kernel NFS server already replacing=
 rpc.svcgssd[4]). The kernel could then, at least optionally, talk to gsspr=
oxy directly to try and obtain credentials.
> > > > > > > > > >
> > > > > > > > > > Failing that, cifs-utils' cifs.spnego could be switched=
 to GSSAPI so that gssproxy's interposer plugin could intercept GSSAPI call=
s and provide them with the required credentials (similar to the NFS client=
 rpc.gssd[5]).
> > > > > > > > > >
> > > > > > > > > > Assuming my understanding is correct so far:
> > > > > > > > > >
> > > > > > > > > > Is anyone doing any work on this and could use some hel=
p (testing, coding)?
> > > > > > > > > > What would be expected complexity and possible roadbloc=
ks when trying to make a start at implementing this?
> > > > > > > > > > Or is the idea moot due to some constraint or recent de=
velopment I'm not aware of?
> > > > > > > > > >
> > > > > > > > > > I have found a recent discussion of the topic on linux-=
cifs[6] which provided no definite answer though.
> > > > > > > > > >
> > > > > > > > > > As a crude attempt at an explicit userspace workaround =
I tried but failed to trick smbclient into initialising a ticket cache usin=
g gssproxy for cifs.spnego to find later on.
> > > > > > > > > > Is this something that could be implemented without too=
 much redundant effort (or should already work, perhaps using a different t=
ool)?
> > > > > > > > > >
> > > > > > > > > > [1] https://github.com/gssapi/gssproxy/blob/main/docs/N=
FS.md#user-impersonation-via-constrained-delegation
> > > > > > > > > > [2] https://pagure.io/gssproxy/issue/56
> > > > > > > > > > [3] https://github.com/gssapi/gssproxy/blob/main/docs/P=
rotocolDocumentation.md
> > > > > > > > > > [4] https://github.com/gssapi/gssproxy/blob/main/docs/N=
FS.md#nfs-server
> > > > > > > > > > [5] https://github.com/gssapi/gssproxy/blob/main/docs/N=
FS.md#nfs-client
> > > > > > > > > > [6] https://www.spinics.net/lists/linux-cifs/msg20182.h=
tml
> > > > > > > > > > --
> > > > > > > > > > Thanks,
> > > > > > > > > > Michael
> > > > > > > > > > _______________________________________________
> > > > > > > > > > gss-proxy mailing list -- gss-proxy@lists.fedorahosted.=
org
> > > > > > > > > > To unsubscribe send an email to gss-proxy-leave@lists.f=
edorahosted.org
> > > > > > > > > > Fedora Code of Conduct: https://docs.fedoraproject.org/=
en-US/project/code-of-conduct/
> > > > > > > > > > List Guidelines: https://fedoraproject.org/wiki/Mailing=
_list_guidelines
> > > > > > > > > > List Archives: https://lists.fedorahosted.org/archives/=
list/gss-proxy@lists.fedorahosted.org
> > > > > > > > >
> > > > > > > > > --
> > > > > > > > > Simo Sorce
> > > > > > > > > RHEL Crypto Team
> > > > > > > > > Red Hat, Inc
> > > > > > > > >
> > > > > > > > >
> > > > > > > > >
> > > > > > > > >
> > > > > > >
> > > > > > > --
> > > > > > > Simo Sorce
> > > > > > > RHEL Crypto Team
> > > > > > > Red Hat, Inc
> > > > > > >
> > > > > > >
> > > > > > >
> > > > > > >
> > > > >
> > > > > --
> > > > > Simo Sorce
> > > > > RHEL Crypto Team
> > > > > Red Hat, Inc
> > > > >
> > > > >
> > > > >
> > > > >
> > >
> > > --
> > > Simo Sorce
> > > RHEL Crypto Team
> > > Red Hat, Inc
> > >
> > >
> > >
> > >
>
> --
> Simo Sorce
> RHEL Crypto Team
> Red Hat, Inc
>
>
>
>

