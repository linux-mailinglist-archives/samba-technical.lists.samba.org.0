Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D0BF3482C18
	for <lists+samba-technical@lfdr.de>; Sun,  2 Jan 2022 17:33:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=GIVbZ1XBMOWPL/zoXI8aDKLYQ4VBp0+MVfN0Sqp5lrM=; b=mAAR3y47URRnvFAMkuSU9v3Wl3
	Paw9+dEjqIgNbaIO1n8/Cm8LV98mnaLyXVlpvi9QqPLD8iol3dwbv4sjOSA589bNVZXste6vMYoeP
	R8sUplbOZv30L+MPBNBPb8YGfQn+h7I9ho8W4Y2mWbbTVqANGwWuUt5vwiXYw7uW3wTzchOUkhFSW
	YfJTPgKMxhNpntuiSVbWXF3uWvDXmkHfYFFgFruy1IUJ74bjKVILTU4oQpaY6gWo6XZpEBYI8pvq+
	18hXjBNbRwi97HmIKdTmc7HqaB19hQlnUSZ6195H9eB/iLruJyiucd3bDLcRuRqH2Ppv2yk+uMOMN
	11U+u9Zw==;
Received: from ip6-localhost ([::1]:21872 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1n43mo-004R3L-KO; Sun, 02 Jan 2022 16:32:46 +0000
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a]:34336) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1n43mi-004R38-Fl; Sun, 02 Jan 2022 16:32:43 +0000
Received: by mail-il1-x12a.google.com with SMTP id d14so24426377ila.1;
 Sun, 02 Jan 2022 08:32:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GIVbZ1XBMOWPL/zoXI8aDKLYQ4VBp0+MVfN0Sqp5lrM=;
 b=KBH8UcLCmcUTGTUCuUhRyudc9sjnquQRVNEpDv7t5zgVbquCG7YPESPSQK9InvWkAq
 Xj7qZDSI5fuR0mnNsC16wR8RKNkKb52TPZ2mVfxYDWi900m66ho8FUglcfp7J+5VypEg
 SqcH2CrwjrBJ7xaKBkM4ifxR/SqL8gs3cYGTNsZcvANXyZ54eWhGNRJ8b9i/3mXfIPwc
 2sv3EWionc9C7UHvZhgjDNg4dPl6DZmmpADG9kQGjoMlODF8GtO9Cg4/YUhcZZ8UK4GJ
 d3d2EJDw3q+4qu90Rg1uzJYhyFGFh8CJZIbNWBvr2V8aKbFNs2AxU/zJQggb7I1KEznL
 3DUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GIVbZ1XBMOWPL/zoXI8aDKLYQ4VBp0+MVfN0Sqp5lrM=;
 b=ZoDEaT+skcGwgNh6gUr5F5+RhnQ10Gr84bBqSWTTssS4yU9rC3qtqaaHQyym+CZxY/
 t3Fa0Vho4GIZd0la0beo+8HVKz0Ru0DcDyyanNqSJ/BzwYJD/r1rqppQv9SNZGiBM6Vf
 o9QqGrLbsYw8AGF1/6CG3EIBsbppl1/NYuarU8TkWjfgBgGFJj8uzbi9qxeg0py1epW9
 3+SuIy6nnvE5hN+Wri80e2resqIAciKCmMjVylrs1SamYHL/7AE35uk9kVJFG+j7CLKH
 Rt8OQxy55jlloGjKuaURLEHS0KSui6QvtOi42LLFhngB3PNa/oJUOwzEejU8rCuglolj
 9QLg==
X-Gm-Message-State: AOAM5304MqJEsYZs3UK3Juqqv2rsCktgGRxqPLpvhb7ecI1xeoOQBp9D
 VI+O8KBDYVFQXEc5opKJKd4nFEt2wMqAMFcOHEs=
X-Google-Smtp-Source: ABdhPJyBRzhrP7CgiBkh9HUXZLdVv9UpzELyeRkiz2YG+JnCtpxRjTpTv173XGEccxr1D/XLaMySf4h7Sjh8We4K5YE=
X-Received: by 2002:a92:c24b:: with SMTP id k11mr21117391ilo.198.1641141151531; 
 Sun, 02 Jan 2022 08:32:31 -0800 (PST)
MIME-Version: 1.0
References: <CAKywueSZyJtH_V8MVa5bznPN=RdjbphY7xo74ABWn=bMAud+ZQ@mail.gmail.com>
In-Reply-To: <CAKywueSZyJtH_V8MVa5bznPN=RdjbphY7xo74ABWn=bMAud+ZQ@mail.gmail.com>
Date: Sun, 2 Jan 2022 18:32:20 +0200
Message-ID: <CAOQ4uxg2K-hgEvh==yrG49fRshHr3ahSKecOoCok5mafkZtSSw@mail.gmail.com>
Subject: Re: [ANNOUNCE] cifs-utils release 6.12 ready for download
To: Pavel Shilovsky <pshilovsky@samba.org>,
 Boris Protopopov <pboris@amazon.com>
Content-Type: text/plain; charset="UTF-8"
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
From: Amir Goldstein via samba-technical <samba-technical@lists.samba.org>
Reply-To: Amir Goldstein <amir73il@gmail.com>
Cc: Shyam Prasad N <nspmangalore@gmail.com>,
 linux-cifs <linux-cifs@vger.kernel.org>,
 Rohith Surabattula <rohiths.msft@gmail.com>,
 "Paulo Alcantara \(SUSE\)" <pc@cjr.nz>,
 samba-technical <samba-technical@lists.samba.org>,
 =?UTF-8?Q?Aur=C3=A9lien_Aptel?= <aaptel@suse.com>,
 Ronnie Sahlberg <lsahlber@redhat.com>, samba@lists.samba.org,
 Pavel Shilovskiy <pshilov@microsoft.com>,
 Steve French <stfrench@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, Dec 31, 2020 at 10:09 PM Pavel Shilovsky via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> New version 6.12 of cifs-utils has been released today.
>
> Highlighted changes:
>
> - get/setcifsacl tools are improved to support changing owner, group and SACLs
> - mount.cifs is enhanced to use SUDO_UID env variable for cruid
> - smbinfo is re-written in Python language
>
> webpage: https://wiki.samba.org/index.php/LinuxCIFS_utils
> tarball: https://download.samba.org/pub/linux-cifs/cifs-utils/
> git: git://git.samba.org/cifs-utils.git
> gitweb: http://git.samba.org/?p=cifs-utils.git;a=summary
>
> Detailed list of changes since 6.11 was released:
>
> 73008e3 cifs-utils: bump version to 6.12
> 16af2c4 smbinfo: fix fsctl-getobjid output
> 85a7865 smbinfo: fix list-snapshots output and installation
> 207f192 cifs.upcall: drop bounding capabilities only if CAP_SETPCAP is given
> 1a15076 mount.cifs: use SUDO_UID env variable for cruid
> 7156c6e mount.cifs: fix max buffer size when parsing snapshot option
> 8f46aaa Add missing position handling to mount parameters
> gid/backup_gid/snapshot
> 4205fdc cifs.upcall: update the cap bounding set only when CAP_SETPCAP is given
> e406fb1 mount.cifs: update the cap bounding set only when CAP_SETPCAP is given
> c3f8e81 Extend cifs acl utilities to handle SACLs
> 6da2dd3 getcifsacl: return error if input path doesn't exist
> 1f37d9c Fix mount error when mount point has an extra trailing slash.
> 1252355 mount.cifs: ignore comment mount option
> ff54e6f setcifsacl: fix quoting of backslash in man page
> c6507ce Separate binary names using comma in mount.cifs.rst
> aeaa786 cifs-utils: fix probabilistic compiling error
> c608a7f cifs-utils: Don't create symlinks for mans if mans are disabled
> a00e843 cifs-utils: Respect DESTDIR when installing smb3 stuff
> b9d94cd mount.cifs.rst: add nolease mount option
> 3d399e4 Add support for setting owner and group in ntsd
> a138fd1 Convert owner and group SID offsets to LE format
> 9bd8c8d smbinfo: remove invalid arguments to ioctl method
> 422f0e9 smbinfo: rewrite in python
>
> Summary:
>
> Alexander Koch (1):
>       cifs.upcall: drop bounding capabilities only if CAP_SETPCAP is given
>
> Aurelien Aptel (1):
>       smbinfo: rewrite in python
>
> Bjoern Jacke (1):
>       setcifsacl: fix quoting of backslash in man page
>
> Boris Protopopov (3):
>       Convert owner and group SID offsets to LE format
>       Add support for setting owner and group in ntsd
>       Extend cifs acl utilities to handle SACLs
>

Guys,

I realize this question is in a year delay, but how is setting group SID
via smb3_ntsd/smb3_ntsd_full expected to work with this kernel code:

                                switch (handler->flags) {
                                case XATTR_CIFS_NTSD_FULL:
                                        aclflags = (CIFS_ACL_OWNER |
                                                    CIFS_ACL_DACL |
                                                    CIFS_ACL_SACL);
                                        break;
                                case XATTR_CIFS_NTSD:
                                        aclflags = (CIFS_ACL_OWNER |
                                                    CIFS_ACL_DACL);
                                        break;

Shouldn't aclflags include CIFS_ACL_GROUP?
BTW, CIFS_ACL_GROUP was not set even before
smb3_ntsd_full patches.

What am I missing?

Thanks,
Amir.

