Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C03A6436E4B
	for <lists+samba-technical@lfdr.de>; Fri, 22 Oct 2021 01:24:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=UlXYiQg1gp2NsuDZqrGfhB0/NfJQ+DTDE3wUKBF2fl4=; b=BtfUSksijJW5hnDSQ9hUnQeZmg
	U+CJNpTX88bnsdvmcwt3n8aiv5dxM9ox8iV4K8/Z98UmUWDD6e3LoQ+F/sMH3M3ktkkZe65scPhpS
	tEHjxCw1otLZAVHNIn+MpmG6NRnqHYKuY1i3zKmIGPgNwBIJTDlGyJmjl6x9lBXzvNZbBJ9IGlLnF
	j1zVftQxRk3gDtgDB/DjN8kI/Wp0wBbeqDZltItwg9TEJO4tqubHf3P85oma2SL+FpfsFKq+YHaYL
	saO7Ym/YE0hJcKTUys7xYAhr8E3jfwxkJHf03Q/sktj5Qp6Nk1sriEYpoNgu67TbpCBZXOGAX9Njr
	TI/4nTvg==;
Received: from ip6-localhost ([::1]:27720 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mdhPb-00B5S2-KM; Thu, 21 Oct 2021 23:23:51 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:44550) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mdhPT-00B5Rt-VM
 for samba-technical@lists.samba.org; Thu, 21 Oct 2021 23:23:48 +0000
Received: by mail-ed1-x52a.google.com with SMTP id w14so7170853edv.11
 for <samba-technical@lists.samba.org>; Thu, 21 Oct 2021 16:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=UlXYiQg1gp2NsuDZqrGfhB0/NfJQ+DTDE3wUKBF2fl4=;
 b=FNaOpIb3BGyW6NUlHgCVUlENS5Z9hw3PpV0pRFiC9S+m4976+ALMSHGjjaK+7mr9k8
 sSe2S0VFaQEzcp456QIOhE8byDD70+0SkLJ/JsGJ07+bKcMNjg4RfQOVI4vZSiHXalNu
 PnVN92CCABqgHeXNHUeAt/6u0UkLFQgCx5wYME6XheHXWpbaxphpHwbUMuQSX5Ck515C
 7bYeoUycXs6QHFlbO2OD06W6ioWj2l1kDm+HBYOiNQc86/VMs9NGiQ7sqhMzTgnm0JNM
 iZ6TmC+Cjs3Sv5RNxtvLgcDPgUFvAL13Akbp01arvqhxcnYgZUqlpMbmrMWroz9bdk9U
 N7IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=UlXYiQg1gp2NsuDZqrGfhB0/NfJQ+DTDE3wUKBF2fl4=;
 b=slx36j16XmCBwA6O+DCbhGwmHGKGLfTc8JFQuC2dUzQ5Eo/6I9fSq8AC6OFh795Ze+
 E8c/z8QUvkW0Z2vAU6jPhQvsUU3GekOeHf2t5uVRE50WHoZ8DEAU4frx91Pfz3+gusuQ
 vNTU3rOjRXyMqiDM+V47xoECyytMEVE3JNEBJAzYCSkqVrMhQkQJyzXZyD3P0RG9nhf/
 iBeLa0ZGxJwyLitn5J/t/wSN3v6K8VjrsvxUG4iUX1ZZRmHkm+5FgLpAjqeI2NYHYJAL
 PrHoXs6VnchuBYkBhjrGgZLbNlHZWOJ/6REyFFNIwD+tgr1QxOTxtJU+pM8y/YYdpi5e
 dV7w==
X-Gm-Message-State: AOAM530i+yt76mXc3/HpKtGZ00N3KeflvJmHHZHozgGo7zrI9Wz+iMgC
 iSoElD5+MewawAgwzkduvzDab/APagMl9zYjXw==
X-Google-Smtp-Source: ABdhPJxFstpjXyR/Z0t/07QzVc5PtMyigd+7xqyM3XdkM8rNbzmu6r2KvH/InrFYV3Nh2c/QXKWJKCQtNwrJNNS3ewA=
X-Received: by 2002:a05:6402:154b:: with SMTP id
 p11mr992340edx.325.1634858621195; 
 Thu, 21 Oct 2021 16:23:41 -0700 (PDT)
MIME-Version: 1.0
References: <2e241ceaece6485289b1cddb84ec77ca@atos.net>
 <04d24a21a7a462b3dc316959c3a3b1c8be8caac3.camel@redhat.com>
 <CAH2r5mt9r6nWop_ekbe1CsinztUiGhP2-bxWFkRqHXOP=MXcVQ@mail.gmail.com>
 <c49c0a18c228e6aa43dbb2cbab7e0a266d1c0371.camel@redhat.com>
 <CANT5p=p_G+jMMVMkYDL=fXZi_OO7eY2Foz8VkyQuT+1h5Xgifw@mail.gmail.com>
 <facbd0542074a5b8ef2f6f3d5649010503d8d84d.camel@redhat.com>
 <CALe0_75RLR=gcwitnxvACh1mt3jnOGHFx7baO0YRhwEfKwFoGg@mail.gmail.com>
 <CAKywueTUqhathrJmPc7eyNojv1F=199mNcFCENzoQjntK+CAzw@mail.gmail.com>
 <10598d01fe09433ea57a38142b7fb854@atos.net>
 <CALe0_74J8h5F4k2aH2Vh5RvtEtfBZ0nrvE614uM87AuVnWZ+gw@mail.gmail.com>
In-Reply-To: <CALe0_74J8h5F4k2aH2Vh5RvtEtfBZ0nrvE614uM87AuVnWZ+gw@mail.gmail.com>
Date: Thu, 21 Oct 2021 16:23:29 -0700
Message-ID: <CAKywueSC6azd68E7MHQKtebGL7B=v4Z4O+5tGU3vf3WJbSZgnw@mail.gmail.com>
Subject: Re: [gssproxy] cifs-utils, Linux cifs kernel client and gssproxy
To: Jacob Shivers <jshivers@redhat.com>
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
From: Pavel Shilovsky via samba-technical <samba-technical@lists.samba.org>
Reply-To: Pavel Shilovsky <piastryyy@gmail.com>
Cc: Shyam Prasad N <nspmangalore@gmail.com>,
 "linux-cifs@vger.kernel.org" <linux-cifs@vger.kernel.org>, "Weiser,
 Michael" <michael.weiser@atos.net>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>,
 Steve French <smfrench@gmail.com>,
 The GSS-Proxy developers and users mailing list
 <gss-proxy@lists.fedorahosted.org>, Simo Sorce <simo@redhat.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hello Michael, Jacob,

The cifs.upcall patch is applied with some minor adjustments (code
style and a patch description) on top of the next branch on github:

https://github.com/piastry/cifs-utils/commit/3d681bb5c140376ccc19e48711231a=
eef1e87aa9

Please let me know if it looks good and/or if you have other suggestions.

The only concern that I have is the compile warning below. Would
appreciate it if you provide a fix for that.

gcc -DHAVE_CONFIG_H -I.    -Wall -Wextra -D_FORTIFY_SOURCE=3D2 -fpie
-pie -Wl,-z,relro,-z,now -g -O2 -MT cifs.upcall.o -MD -MP -MF
.deps/cifs.upcall.Tpo -c -o cifs.upcall.o cifs.upcall.c
cifs.upcall.c: In function =E2=80=98cifs_gss_get_req=E2=80=99:
cifs.upcall.c:808:4: warning: passing argument 5 of
=E2=80=98gss_init_sec_context=E2=80=99 discards =E2=80=98const=E2=80=99 qua=
lifier from pointer target
type [-Wdiscarded-qualifiers]
    gss_mech_krb5, /* force krb5 */
    ^
In file included from /usr/include/gssapi/gssapi_generic.h:31:0,
                 from cifs.upcall.c:40:
/usr/include/gssapi/gssapi.h:437:1: note: expected =E2=80=98gss_OID {aka
struct gss_OID_desc_struct *}=E2=80=99 but argument is of type =E2=80=98con=
st
gss_OID_desc * const {aka const struct gss_OID_desc_struct * const}=E2=80=
=99
 gss_init_sec_context(
 ^
mv -f .deps/cifs.upcall.Tpo .deps/cifs.upcall.Po
gcc -Wall -Wextra -D_FORTIFY_SOURCE=3D2 -fpie -pie -Wl,-z,relro,-z,now
-g -O2   -o cifs.upcall cifs.upcall.o data_blob.o asn1.o spnego.o
-ltalloc -lkeyutils -lgssapi_krb5 -lkrb5

--
Best regards,
Pavel Shilovsky

=D1=87=D1=82, 30 =D1=81=D0=B5=D0=BD=D1=82. 2021 =D0=B3. =D0=B2 16:18, Jacob=
 Shivers <jshivers@redhat.com>:

>
> Hello Pavel/Michael,
>
> The only other addition would be to modify
> /etc/gssproxy/99-nfs-client.conf to also use the 'program' directive,
> i.e. 'program =3D /usr/sbin/rpc.gssd' so that both rpc.gssd and
> cifs.upcall can make use of the default gssproxy socket
> '/var/lib/gssproxy/default.sock'
>
> If the 'program' directive is not included in the respective drop
> files, then gssproxy can not differentiate which service is to be used
> and will fail to start.
>
> In total, a gssproxy drop file for cifs.upcall, modifying the gssproxy
> drop file for rpc.gssd, and an inclusion of a parameter that sets an
> environmental variable for cifs.upcall to use gssproxy should be all
> that is needed. I had not submitted a pull request for gssproxy yet as
> the extended cifs.upcall functionality had not received any further
> feedback. I can submit something if you are ready to include the patch
> to cifs.upcall
>
> Thanks,
>
> Jacob Shivers
>
> On Mon, Sep 27, 2021 at 3:20 AM Weiser, Michael <michael.weiser@atos.net>=
 wrote:
> >
> > Hello Pavel,
> >
> > > Do we have any more-up-to-date version of the cifs-utils patch other
> > > than the one attached to the email thread? I would like to merge the
> > > patch into the "next" branch so it makes the next release of
> > > cifs-utils.
> >
> > I'm also not aware of a newer version. As one of the initiators of the =
discussion, who's highly interested in seeing this merged, I'm standing by =
to help out with background context, testing or improving the code. (The pa=
tch was meant as a PoC which is why I skipped some reindenting and niceties=
 to keep its approach and impact easy to gauge.)
> >
> > > Also there is a potential helper script mentioned above that is neede=
d
> > > to set up gssproxy properly?
> >
> > I'm not aware of a helper script. gssproxy just needs to be told about =
cifs-utils and how it should be treated using a single config drop file. Al=
so in the meantime, Jacob and I have streamlined the configuration so a sep=
arate UNIX domain socket and tweaking its permissions using a systemd servi=
ce drop-in file is no longer needed. Instead, gssproxy can distinguish mult=
iple clients on the same socket using the calling binary derived from getso=
ckopt/SO_PEERCRED.
> >
> > Finally, environment variable GSS_USE_PROXY needs to be set for cifs.up=
call to enable the gssproxy proxy mech. (Instead of using the env command, =
cifs.upcall could have a command line option similar to rpc.gssd[1] which e=
nds up doing the same thing.)
> >
> > Here's the config summary:
> >
> > # cat /etc/request-key.d/cifs.spnego.conf
> > create  cifs.spnego    * *  /usr/bin/env GSS_USE_PROXY=3Dyes /usr/sbin/=
cifs.upcall %k
> >
> > # cat /etc/gssproxy/99-cifs.conf
> > [service/cifs]
> >   mechs =3D krb5
> > # not needed when program option is used
> > #  socket =3D /var/lib/gssproxy/cifs.sock
> >   program =3D /usr/sbin/cifs.upcall
> >   cred_store =3D keytab:/etc/krb5.keytab
> >   cred_store =3D ccache:FILE:/var/lib/gssproxy/clients/krb5cc_%U
> >   cred_store =3D client_keytab:/var/lib/gssproxy/clients/%U.keytab
> >   cred_usage =3D initiate
> > # allow process with any euid to use the service and receive impersonat=
ed
> > # tickets for services
> >   allow_any_uid =3D yes
> > # allow euid access to keytab
> >   trusted =3D yes
> > # allow impersonation
> >   impersonate =3D yes
> > # allow process with euid 0 to use the keytab
> >   euid =3D 0
> >
> > The actual mount can be done using system credentials from the keytab. =
Small proof session showcasing that gssproxy is involved and working:
> >
> > # systemctl stop gssproxy
> > # mount -o sec=3Dkrb5,multiuser,user=3DFEDORA33\$ //dc/share /mnt
> > # su - adsuser -c "touch /mnt/test"
> > touch: cannot touch '/mnt/test': Permission denied
> > # systemctl start gssproxy
> > # su - adsuser -c "touch /mnt/test"
> > #
> >
> > [1] http://git.linux-nfs.org/?p=3Dsteved/nfs-utils.git;a=3Dblob;f=3Duti=
ls/gssd/gssd.c;h=3D833d8e0110a9737df8ef6ddeb439ba1a37ee9931;hb=3DHEAD#l1128
> >
> > Thanks,
> > Michael
> >
> > ________________________________________
> > From: Pavel Shilovsky <piastryyy@gmail.com>
> > Sent: 24 September 2021 19:09:47
> > To: Jacob Shivers
> > Cc: Simo Sorce; Shyam Prasad N; Steve French; The GSS-Proxy developers =
and users mailing list; linux-cifs@vger.kernel.org; samba-technical@lists.s=
amba.org
> > Subject: Re: [gssproxy] cifs-utils, Linux cifs kernel client and gsspro=
xy
> >
> > Caution! External email. Do not open attachments or click links, unless=
 this email comes from a known sender and you know the content is safe.
> >
> > Catching up on the email thread. For some reason I missed it originally=
 somehow.
> >
> > Do we have any more-up-to-date version of the cifs-utils patch other
> > than the one attached to the email thread? I would like to merge the
> > patch into the "next" branch so it makes the next release of
> > cifs-utils.
> >
> > Also there is a potential helper script mentioned above that is needed
> > to set up gssproxy properly?
> >
> > --
> > Best regards,
> > Pavel Shilovsky
> >
> > =D0=B2=D1=82, 23 =D1=84=D0=B5=D0=B2=D1=80. 2021 =D0=B3. =D0=B2 09:43, J=
acob Shivers <jshivers@redhat.com>:
> > >
> > > I have tested the patches for cifs.upcall and can say that with some
> > > additional modifications to gssproxy the end setup brings a degree of
> > > feature parity to SMB clients that had been previously exclusive to
> > > NFS clients.
> > > Deployment does require some additional configuration, including the
> > > creation of a drop-in file for gssproxy under /etc/gssproxy and for
> > > the gssproxy service managed by systemd
> > >
> > >
> > > ### KDC configuration
> > >
> > >  *** delegation ***
> > >
> > > Constrained Delegation (CD) for the SMB host to the Kerberized SMB se=
rver
> > > Resource Based Constrained Delegation (RBCD) on the Kerberized SMB
> > > server to determine which SMB clients can delegate
> > >
> > >
> > > ### SMB client configuration
> > >
> > >  *** sssd ***
> > >
> > >  Configuration file modification.
> > >
> > > Disable using fully qualified domain names as impersonation does not
> > > correctly handle fully qualified names at time of ticket acquisition.
> > >
> > > use_fully_qualified_names =3D False
> > >
> > >  *** gssproxy ***
> > >
> > >  Drop file creation
> > >
> > > Add a drop file for gssproxy to create the necessary socket and
> > > corresponding settings.
> > >
> > > # cat /etc/gssproxy/99-cifs-client.conf with contents
> > > [service/cifs]
> > > mechs =3D krb5
> > > socket =3D /var/lib/gssproxy/cifs.sock
> > > cred_store =3D keytab:/etc/krb5.keytab
> > > cred_usage =3D initiate
> > > euid =3D 0
> > > impersonate =3D yes
> > > allow_any_uid =3D yes
> > >
> > >  Service drop-in file.
> > >
> > > Create a drop-in file to limit socket access for an unattended user, =
if desired.
> > >
> > > # cat /etc/systemd/system/gssproxy.service.d/90-cifs.conf
> > > [Service]
> > > # Limit cifs.sock socket file accessiblility to just the unattended u=
ser.
> > > ExecStartPost=3D/bin/bash -c 'chmod 660 /var/lib/gssproxy/cifs.sock &=
&
> > > setfacl -m u:chang:rw /var/lib/gssproxy/cifs.sock'
> > >
> > >
> > >  *** cifs.upcall ***
> > >
> > >  cifs.spnego.conf modification
> > >
> > > Allow for gssprxy to be used and specify socket file
> > >
> > > # cat /etc/request-key.d/cifs.spnego.conf
> > > create  cifs.spnego    * *  /usr/bin/env GSS_USE_PROXY=3Dyes
> > > GSSPROXY_SOCKET=3D/var/lib/gssproxy/cifs.sock /usr/sbin/cifs.upcall %=
k
> > >
> > >    include the '-t' flag to allow for accessing a Kerberized DFS
> > > namespace using a domain based mount, i.e //example.net/dfs/share
> > >
> > > create  cifs.spnego    * *  /usr/bin/env GSS_USE_PROXY=3Dyes
> > > GSSPROXY_SOCKET=3D/var/lib/gssproxy/cifs.sock /usr/sbin/cifs.upcall -=
t
> > > %k
> > >
> > >
> > > The above does allow for unattended users to access a Kerberized SMB
> > > share while limiting access to only a specific user:
> > >
> > > # mount //win2k16-dfs1.example.net/greendale/ /mnt -o
> > > sec=3Dkrb5,username=3D'TEST-BOX$@EXAMPLE.NET',multiuser
> > >
> > > # su - jeff
> > > Last login: Fri Feb  5 12:14:42 EST 2021 on pts/0
> > > [jeff@test-box ~]$ ll /mnt
> > > ls: cannot access '/mnt': Permission denied
> > > [jeff@test-box ~]$ logout
> > >
> > > # su - chang
> > > Last login: Fri Feb  5 12:14:46 EST 2021 on pts/0
> > > [chang@test-box ~]$ klist
> > > klist: No credentials cache found (filename: /tmp/krb5cc_602001123)
> > > [chang@test-box ~]$ ls -l /mnt
> > > total 143
> > >
> > > drwxr-xr-x. 2 chang domain users      0 Oct  4  2018  DfsrPrivate
> > > -rwxr-xr-x. 1 chang domain users      0 Sep 22 10:07  test_file
> > > -rwxr-xr-x. 1 chang domain users      0 Dec 14 15:22  whoami
> > > drwxr-xr-x. 2 chang domain users      0 Dec  7 12:54  winhome
> > >
> > > [chang@test-box ~]$ klist
> > > klist: No credentials cache found (filename: /tmp/krb5cc_602001123)
> > >
> > >
> > > Feb 23 12:22:44.857956 test-box.example.net su[1672]: (to jeff) root =
on pts/1
> > > Feb 23 12:22:44.866263 test-box.example.net su[1672]:
> > > pam_systemd(su-l:session): Cannot create session: Already running in =
a
> > > session or user slice
> > > Feb 23 12:22:44.867158 test-box.example.net su[1672]:
> > > pam_unix(su-l:session): session opened for user jeff by root(uid=3D0)
> > > Feb 23 12:22:46.253310 test-box.example.net cifs.upcall[1700]: key
> > > description: cifs.spnego;0;0;39010000;ver=3D0x2;host=3Dwin2k16-dfs1.e=
xample.net;ip4=3D192.168.124.132;sec=3Dkrb5;uid=3D0x23e1cedc;creduid=3D0x23=
e1cedc;pid=3D0x6a3
> > > Feb 23 12:22:46.253335 test-box.example.net cifs.upcall[1700]: ver=3D=
2
> > > Feb 23 12:22:46.253338 test-box.example.net cifs.upcall[1700]:
> > > host=3Dwin2k16-dfs1.example.net
> > > Feb 23 12:22:46.253342 test-box.example.net cifs.upcall[1700]:
> > > ip=3D192.168.124.132
> > > Feb 23 12:22:46.253344 test-box.example.net cifs.upcall[1700]: sec=3D=
1
> > > Feb 23 12:22:46.253348 test-box.example.net cifs.upcall[1700]: uid=3D=
602001116
> > > Feb 23 12:22:46.253352 test-box.example.net cifs.upcall[1700]: credui=
d=3D602001116
> > > Feb 23 12:22:46.253365 test-box.example.net cifs.upcall[1700]: pid=3D=
1699
> > > Feb 23 12:22:46.253978 test-box.example.net cifs.upcall[1700]:
> > > get_cachename_from_process_env: pathname=3D/proc/1699/environ
> > > Feb 23 12:22:46.254995 test-box.example.net cifs.upcall[1700]:
> > > get_existing_cc: default ccache is FILE:/tmp/krb5cc_602001116
> > > Feb 23 12:22:46.255015 test-box.example.net cifs.upcall[1700]:
> > > get_tgt_time: unable to get principal
> > > Feb 23 12:22:46.255021 test-box.example.net cifs.upcall[1700]:
> > > handle_krb5_mech: getting service ticket for win2k16-dfs1.example.net
> > > Feb 23 12:22:46.255024 test-box.example.net cifs.upcall[1700]:
> > > handle_krb5_mech: using GSS-API
> > > Feb 23 12:22:46.259295 test-box.example.net cifs.upcall[1700]: GSS-AP=
I
> > > error init_sec_context: Unspecified GSS failure.  Minor code may
> > > provide more information
> > > Feb 23 12:22:46.259306 test-box.example.net cifs.upcall[1700]: GSS-AP=
I
> > > error init_sec_context: No Kerberos credentials available (default
> > > cache: FILE:/tmp/krb5cc_602001116)
> > > Feb 23 12:22:46.259311 test-box.example.net cifs.upcall[1700]:
> > > handle_krb5_mech: failed to obtain service ticket via GSS (851968)
> > > Feb 23 12:22:46.259314 test-box.example.net cifs.upcall[1700]: Unable
> > > to obtain service ticket
> > > Feb 23 12:22:46.259323 test-box.example.net cifs.upcall[1700]: Exit
> > > status 851968
> > > Feb 23 12:22:46.262827 test-box.example.net kernel: CIFS VFS:
> > > \\win2k16-dfs1.example.net Send error in SessSetup =3D -126
> > > Feb 23 12:22:47.398266 test-box.example.net su[1672]:
> > > pam_unix(su-l:session): session closed for user jeff
> > > Feb 23 12:22:49.159640 test-box.example.net su[1702]: (to chang) root=
 on pts/1
> > > Feb 23 12:22:49.173264 test-box.example.net su[1702]:
> > > pam_systemd(su-l:session): Cannot create session: Already running in =
a
> > > session or user slice
> > > Feb 23 12:22:49.173967 test-box.example.net su[1702]:
> > > pam_unix(su-l:session): session opened for user chang by root(uid=3D0=
)
> > > Feb 23 12:22:51.878743 test-box.example.net cifs.upcall[1729]: key
> > > description: cifs.spnego;0;0;39010000;ver=3D0x2;host=3Dwin2k16-dfs1.e=
xample.net;ip4=3D192.168.124.132;sec=3Dkrb5;uid=3D0x23e1cee3;creduid=3D0x23=
e1cee3;pid=3D0x6c0
> > > Feb 23 12:22:51.878765 test-box.example.net cifs.upcall[1729]: ver=3D=
2
> > > Feb 23 12:22:51.878769 test-box.example.net cifs.upcall[1729]:
> > > host=3Dwin2k16-dfs1.example.net
> > > Feb 23 12:22:51.878773 test-box.example.net cifs.upcall[1729]:
> > > ip=3D192.168.124.132
> > > Feb 23 12:22:51.878776 test-box.example.net cifs.upcall[1729]: sec=3D=
1
> > > Feb 23 12:22:51.878780 test-box.example.net cifs.upcall[1729]: uid=3D=
602001123
> > > Feb 23 12:22:51.878783 test-box.example.net cifs.upcall[1729]: credui=
d=3D602001123
> > > Feb 23 12:22:51.878786 test-box.example.net cifs.upcall[1729]: pid=3D=
1728
> > > Feb 23 12:22:51.879060 test-box.example.net cifs.upcall[1729]:
> > > get_cachename_from_process_env: pathname=3D/proc/1728/environ
> > > Feb 23 12:22:51.879799 test-box.example.net cifs.upcall[1729]:
> > > get_existing_cc: default ccache is FILE:/tmp/krb5cc_602001123
> > > Feb 23 12:22:51.879819 test-box.example.net cifs.upcall[1729]:
> > > get_tgt_time: unable to get principal
> > > Feb 23 12:22:51.879824 test-box.example.net cifs.upcall[1729]:
> > > handle_krb5_mech: getting service ticket for win2k16-dfs1.example.net
> > > Feb 23 12:22:51.879827 test-box.example.net cifs.upcall[1729]:
> > > handle_krb5_mech: using GSS-API
> > > Feb 23 12:22:51.886573 test-box.example.net gssproxy[1000]:
> > > [2021/02/23 17:22:51]: Client [2021/02/23 17:22:51]:
> > > (/usr/sbin/cifs.upcall) [2021/02/23 17:22:51]:  connected (fd =3D
> > > 14)[2021/02/23 17:22:51]:  (pid =3D 1729) (uid =3D 602001123) (gid =
=3D
> > > 602000513)[2021/02/23 17:22:51]:  (context =3D
> > > system_u:system_r:kernel_t:s0)[>
> > > Feb 23 12:22:51.886573 test-box.example.net gssproxy[1000]: [CID
> > > 14][2021/02/23 17:22:51]: Connection matched service cifs
> > > Feb 23 12:22:51.886573 test-box.example.net gssproxy[1000]: [CID
> > > 14][2021/02/23 17:22:51]: gp_rpc_execute: executing 6
> > > (GSSX_ACQUIRE_CRED) for service "cifs", euid: 602001123,socket:
> > > /var/lib/gssproxy/cifs.sock
> > > Feb 23 12:22:51.886573 test-box.example.net gssproxy[1000]:
> > > GSSX_ARG_ACQUIRE_CRED( call_ctx: { "" [  ] } input_cred_handle: <Null=
>
> > > add_cred: 0 desired_name: <Null> time_req: 0 desired_mechs: { }
> > > cred_usage: INITIATE initiator_time_req: 0 acceptor_time_req: 0 )
> > > Feb 23 12:22:52.346639 test-box.example.net gssproxy[1000]:
> > > GSSX_RES_ACQUIRE_CRED( status: { 0 { 1 2 840 113554 1 2 2 } 0 "" "" [
> > > ] } output_cred_handle: { "chang@EXAMPLE.NET" [ { "chang@EXAMPLE.NET"
> > > { 1 2 840 113554 1 2 2 } INITIATE 36000 0 } ] [ K.....T.....pJv.... ]
> > > 0 } )
> > > Feb 23 12:22:52.348086 test-box.example.net gssproxy[1000]: [CID
> > > 14][2021/02/23 17:22:52]: Connection matched service cifs
> > > Feb 23 12:22:52.348086 test-box.example.net gssproxy[1000]: [CID
> > > 14][2021/02/23 17:22:52]: gp_rpc_execute: executing 8
> > > (GSSX_INIT_SEC_CONTEXT) for service "cifs", euid: 602001123,socket:
> > > /var/lib/gssproxy/cifs.sock
> > > Feb 23 12:22:52.348086 test-box.example.net gssproxy[1000]:
> > > GSSX_ARG_INIT_SEC_CONTEXT( call_ctx: { "" [  ] } context_handle:
> > > <Null> cred_handle: { "chang@EXAMPLE.NET" [ { "chang@EXAMPLE.NET" { 1
> > > 2 840 113554 1 2 2 } INITIATE 36000 0 } ] [ K.....T.....pJv.... ] 0 }
> > > target_name: "cifs@win2k16-dfs1.example.net" mech>
> > > Feb 23 12:22:52.348086 test-box.example.net gssproxy[1000]: [CID
> > > 14][2021/02/23 17:22:52]: Credentials allowed by configuration
> > > Feb 23 12:22:52.357103 test-box.example.net gssproxy[1000]:
> > > GSSX_RES_INIT_SEC_CONTEXT( status: { 0 { 1 2 840 113554 1 2 2 } 0 ""
> > > "" [  ] } context_handle: { [ ......H............ ] [  ] 0 { 1 2 840
> > > 113554 1 2 2 } "chang@EXAMPLE.NET"
> > > "cifs/win2k16-dfs1.example.net@EXAMPLE.NET" 36000 432 1 1 }
> > > output_token: [ .....>
> > > Feb 23 12:22:52.357419 test-box.example.net cifs.upcall[1729]: Exit s=
tatus 0
> > >
> > >
> > > Ultimately a helper-script packaged with cifs-utils or a separate
> > > package entirely could be responsible for adding the file under
> > > /etc/gssproxy and the drop-in file for systemd. The helper script
> > > could take a series of users/groups as arguments that would limit
> > > access to the socket file or there could be a separate config file
> > > that is read from to determine if access to the cifs.sock socket
> > > should be limited.
> > >
> > >
> > > On Fri, Feb 19, 2021 at 12:38 PM Simo Sorce <simo@redhat.com> wrote:
> > > >
> > > > On Fri, 2021-02-19 at 03:30 -0800, Shyam Prasad N wrote:
> > > > > Hi Simo,
> > > > >
> > > > > > Finally the GSS-Proxy mechanism is namespace compatible, so you=
 also
> > > > > > get the ability to define different auth daemons per different
> > > > > > containers, no need to invent new mechanisms for that or change=
 yet
> > > > > > again protocols/userspace to obtain container capabilities.
> > > > >
> > > > > Could you please point me to the documentation for doing this?
> > > >
> > > > I do not know if the kernel documents this, but the way gssproxy wo=
rks
> > > > is that when you start the daemon it pokes at the kernel to let it =
know
> > > > the socket is available. So then the kernel opens the socket in the
> > > > namespace the proxy is running into (detected from the poking
> > > > operation, which is a write in a proc file).
> > > >
> > > > HTH,
> > > > Simo.
> > > >
> > > > >
> > > > > Regards,
> > > > > Shyam
> > > > >
> > > > > On Thu, Dec 17, 2020 at 5:41 AM Simo Sorce <simo@redhat.com> wrot=
e:
> > > > > > Hi Steve,
> > > > > >
> > > > > > GSSAPI and krb5 as implemented in system krb5 libraries exists =
from
> > > > > > longer than Samba has implemented those capabilities, I do not =
think it
> > > > > > make sense to reason along those lines.
> > > > > >
> > > > > > GSS-Proxy has been built with a protocol to talk from the kerne=
l that
> > > > > > resolved a number of issues for knfsd (eg big packet sizes when=
 a MS-
> > > > > > PAC is present).
> > > > > >
> > > > > > And Samba uses internally exactly the same krb5 mechanism as it=
 defers
> > > > > > to the kerberos libraries as well.
> > > > > >
> > > > > > Additionally GSS-Proxy can be very easily extended to also do N=
TLMSSP
> > > > > > using the same interface as I have built the gssntlmssp long ag=
o from
> > > > > > the MS spec, and is probably the most correct NTLMSSP implement=
ation
> > > > > > you can find around.
> > > > > >
> > > > > > Gssntlmssp also has a Winbind backend so you get automaticaly a=
ccess to
> > > > > > whatever cached credentials Winbindd has for users as a bonus (=
although
> > > > > > the integration can be improved there), yet you *can* use it w/=
o
> > > > > > Winbindd just fine providing a credential file (smbpasswd forma=
t
> > > > > > compatible).
> > > > > >
> > > > > > GSS-Proxy is already integrated in distributions because it is =
used by
> > > > > > knfsd, and can be as easily used by cifsd, and you *should* rea=
lly use
> > > > > > it there, so we can have a single, consistent, maintained, mech=
anism
> > > > > > for server side GSS authentication, and not have to repeat and =
reinvent
> > > > > > kernel to userspace mechanisms.
> > > > > >
> > > > > > And if you add it for cifsd you have yet another reason to do i=
t for
> > > > > > cifs.ko as well.
> > > > > >
> > > > > > Finally the GSS-Proxy mechanism is namespace compatible, so you=
 also
> > > > > > get the ability to define different auth daemons per different
> > > > > > containers, no need to invent new mechanisms for that or change=
 yet
> > > > > > again protocols/userspace to obtain container capabilities.
> > > > > >
> > > > > > For the client we'll need to add some XDR parsing functions in =
kernel,
> > > > > > they were omitted from my original patches because there was no=
 client
> > > > > > side kernel consumer back then, but it i an easy, mechanical ch=
ange.
> > > > > >
> > > > > > HTH,
> > > > > > Simo.
> > > > > >
> > > > > > On Wed, 2020-12-16 at 16:43 -0600, Steve French wrote:
> > > > > > > generally I would feel more comfortable using something (libr=
ary or
> > > > > > > utility) in Samba (if needed) for additional SPNEGO support i=
f
> > > > > > > something is missing (in what the kernel drivers are doing to
> > > > > > > encapsulate Active Directory or Samba AD krb5 tickets in SPNE=
GO) as
> > > > > > > Samba is better maintained/tested etc. than most components. =
 Is there
> > > > > > > something in Samba that could be used here instead of having =
a
> > > > > > > dependency on another project - Samba has been doing Kerberos=
/SPNEGO
> > > > > > > longer than most ...?   There are probably others (jra, Metze=
 etc.)
> > > > > > > that have would know more about gssproxy vs. Samba equivalent=
s though
> > > > > > > and would defer to them ...
> > > > > > >
> > > > > > > On Wed, Dec 16, 2020 at 8:33 AM Simo Sorce <simo@redhat.com> =
wrote:
> > > > > > > > Hi Michael,
> > > > > > > > as you say the best course of action would be for cifs.ko t=
o move to
> > > > > > > > use the RPC interface we defined for knfsd (with any extens=
ions that
> > > > > > > > may  be needed), and we had discussions in the past with ci=
fs upstream
> > > > > > > > developers about it. But nothing really materialized.
> > > > > > > >
> > > > > > > > If something is needed in the short term, I thjink the quic=
kest course
> > > > > > > > of action is indeed to change the userspace helper to use g=
ssapi
> > > > > > > > function calls, so that they can be intercepted like we do =
for rpc.gssd
> > > > > > > > (nfs client's userspace helper).
> > > > > > > >
> > > > > > > > Unfortunately I do not have the cycles to work on that myse=
lf at this
> > > > > > > > time :-(
> > > > > > > >
> > > > > > > > HTH,
> > > > > > > > Simo.
> > > > > > > >
> > > > > > > > On Wed, 2020-12-16 at 10:01 +0000, Weiser, Michael wrote:
> > > > > > > > > Hello,
> > > > > > > > >
> > > > > > > > > I have a use-case for authentication of Linux cifs client=
 mounts without the user being present (e.g. from batch jobs) using gssprox=
y's impersonation feature with Kerberos Constrained Delegation similar to h=
ow it can be done for NFS[1].
> > > > > > > > >
> > > > > > > > > My understanding is that currently neither the Linux cifs=
 kernel client nor cifs-utils userland tools support acquiring credentials =
using gssproxy. The former uses a custom upcall interface to talk to cifs.s=
pnego from cifs-utils. The latter then goes looking for Kerberos ticket cac=
hes using libkrb5 functions, not GSSAPI, which prevents gssproxy from inter=
acting with it.[2]
> > > > > > > > >
> > > > > > > > > From what I understand, the preferred method would be to =
switch the Linux kernel client upcall to the RPC protocol defined by gsspro=
xy[3] (as has been done for the Linux kernel NFS server already replacing r=
pc.svcgssd[4]). The kernel could then, at least optionally, talk to gssprox=
y directly to try and obtain credentials.
> > > > > > > > >
> > > > > > > > > Failing that, cifs-utils' cifs.spnego could be switched t=
o GSSAPI so that gssproxy's interposer plugin could intercept GSSAPI calls =
and provide them with the required credentials (similar to the NFS client r=
pc.gssd[5]).
> > > > > > > > >
> > > > > > > > > Assuming my understanding is correct so far:
> > > > > > > > >
> > > > > > > > > Is anyone doing any work on this and could use some help =
(testing, coding)?
> > > > > > > > > What would be expected complexity and possible roadblocks=
 when trying to make a start at implementing this?
> > > > > > > > > Or is the idea moot due to some constraint or recent deve=
lopment I'm not aware of?
> > > > > > > > >
> > > > > > > > > I have found a recent discussion of the topic on linux-ci=
fs[6] which provided no definite answer though.
> > > > > > > > >
> > > > > > > > > As a crude attempt at an explicit userspace workaround I =
tried but failed to trick smbclient into initialising a ticket cache using =
gssproxy for cifs.spnego to find later on.
> > > > > > > > > Is this something that could be implemented without too m=
uch redundant effort (or should already work, perhaps using a different too=
l)?
> > > > > > > > >
> > > > > > > > > [1] https://github.com/gssapi/gssproxy/blob/main/docs/NFS=
.md#user-impersonation-via-constrained-delegation
> > > > > > > > > [2] https://pagure.io/gssproxy/issue/56
> > > > > > > > > [3] https://github.com/gssapi/gssproxy/blob/main/docs/Pro=
tocolDocumentation.md
> > > > > > > > > [4] https://github.com/gssapi/gssproxy/blob/main/docs/NFS=
.md#nfs-server
> > > > > > > > > [5] https://github.com/gssapi/gssproxy/blob/main/docs/NFS=
.md#nfs-client
> > > > > > > > > [6] https://www.spinics.net/lists/linux-cifs/msg20182.htm=
l
> > > > > > > > > --
> > > > > > > > > Thanks,
> > > > > > > > > Michael
> > > > > > > > > _______________________________________________
> > > > > > > > > gss-proxy mailing list -- gss-proxy@lists.fedorahosted.or=
g
> > > > > > > > > To unsubscribe send an email to gss-proxy-leave@lists.fed=
orahosted.org
> > > > > > > > > Fedora Code of Conduct: https://docs.fedoraproject.org/en=
-US/project/code-of-conduct/
> > > > > > > > > List Guidelines: https://fedoraproject.org/wiki/Mailing_l=
ist_guidelines
> > > > > > > > > List Archives: https://lists.fedorahosted.org/archives/li=
st/gss-proxy@lists.fedorahosted.org
> > > > > > > >
> > > > > > > > --
> > > > > > > > Simo Sorce
> > > > > > > > RHEL Crypto Team
> > > > > > > > Red Hat, Inc
> > > > > > > >
> > > > > > > >
> > > > > > > >
> > > > > > > >
> > > > > >
> > > > > > --
> > > > > > Simo Sorce
> > > > > > RHEL Crypto Team
> > > > > > Red Hat, Inc
> > > > > >
> > > > > >
> > > > > >
> > > > > >
> > > > >
> > > > >
> > > >
> > > > --
> > > > Simo Sorce
> > > > RHEL Crypto Team
> > > > Red Hat, Inc
> > > >
> > > >
> > > >
> > > >
> > >
> >
>

