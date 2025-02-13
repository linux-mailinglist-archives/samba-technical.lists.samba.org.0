Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F04A350D8
	for <lists+samba-technical@lfdr.de>; Thu, 13 Feb 2025 23:03:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=aWe4ZcR9leH+p7tbON4TD61UpNJGfge7vFio00YzpVM=; b=28BAiju/tlM/mrh9wTx+hLCjvX
	WOEyV2Q9UDDPH7xS6312odzu8axz/bJg5Soit05vGlf+Yd5VQfGdi7bV4X8zNn0Ah1ZFmqPQdV0gX
	G2lBmKf/CkHcUwPqGAYqS0kO4ghRBtbydaaqfYIYs02DmmOsWfssg4e2GYefg6AXOg33+ST59HgbT
	UddhIJ+I1JGwZ0HVc64ALCQRAa2qnjrDoKC0iZovdUEsFfBQjzStRW8HmqP9hGUgaWtINW8QhQ7nt
	hyRvROgi48xLRyIGfgYpe6KkT3IGQjrV+lqZAsO9m5eqZzxoTQU+o0m3E40DYOqSjVi2MAoQ4t+SJ
	j2HB52lQ==;
Received: from ip6-localhost ([::1]:22834 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1tihJ1-00CLID-40; Thu, 13 Feb 2025 22:03:35 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a]:57455) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tihIw-00CLI4-Bo
 for samba-technical@lists.samba.org; Thu, 13 Feb 2025 22:03:33 +0000
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-30761be8fa7so14114331fa.2
 for <samba-technical@lists.samba.org>; Thu, 13 Feb 2025 14:03:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739484209; x=1740089009; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=aWe4ZcR9leH+p7tbON4TD61UpNJGfge7vFio00YzpVM=;
 b=fpceecKqOv1RwHAgjQhl/m1kfoD/9bzNKqGjzjsw6/F6a7tTCx2pbvYGW/vfNwbfme
 b2we0Y/tYF9OUgoXfWfrSzfE6luPf4xeck4m1aW5SXbRu6ijieC585ErsdT0Yq5OOdui
 FAJccBdZgHUKtv1LIWQpm2Z7ykeXCD5BAX/NRbxoALK5sguxziqqpFi2hyFjBBOxITUM
 V+s/ke0woPAX9JXbfPRWM5Dy9WnQ53BM9ux6yaVCDdDxpJgPyjV+WCkBdig8AFqFARCq
 N3uCRivFgCt3+M9vj9tMMFg8mIJaws+PDr9qEzXPP9Ecg5dcDs74LEaaIUW96ACUi9xn
 GVSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739484209; x=1740089009;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aWe4ZcR9leH+p7tbON4TD61UpNJGfge7vFio00YzpVM=;
 b=J+WiTnNEOT4YZSN3b0up1g+irH+zZCMV4c/sI1UmfKkUZTtrrk/pOmBlXhRAHTJbEm
 Gk/JH0Yxr1A+2EyMowMHbwCHCmFZK2bxbuqxVEKE7CDm2ygeOe4Mwhk6SZRc0Se8gwBw
 gYEHIuMZDOmYPuvt8pspcK7VUGcP2aklh/qWV7XiE9Xi21YIirTKjHOGvCCjd6fGrNE9
 4jZRYMYSjb7xY6fsqWRagZbTe9UHdVIXExOe7g50oOekceqbf8J6hft9SYN7AWh1GEmj
 mfnIZpH+4K5MsKzUo1fDnlO6TfuiXk1OZ4RI88+L4n287TuQ8J//l2SFliek7c4ugXUM
 0Ffw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXn6KiXCgxoRnqV1kJkoFgFwoPFc5iP7m39n176rLj+pEA6NzDj5YD1wUb8Z3VY0HddegPd3jF8t9GkYdonUvA=@lists.samba.org
X-Gm-Message-State: AOJu0YyshSeBFANr6aN8iZEk6CC5po7T5KcTnb3gkgqUOstTcoPHs/nt
 nJB0kMcN/dlFdy1kLxPmpSp0U08uacYAkfiLaBgmJcXsuv8YLufli6dheHDPWlf9V2TP5FiHEL9
 fyCWhvDNdg9X6D7+RADmTiwFT7iQ=
X-Gm-Gg: ASbGnctdN40QL7GW2Haw4eLdNz20Jc/5TKNxVcaypeS+sRrG5qoZ0jcGuUSX1bwGcdF
 Hjpyw1ceT62WuH871QEWIE38EwDzuRM2PqlTFKJq9ol8VrwHtvqenTh0ehu3uHV9nsYFv
X-Google-Smtp-Source: AGHT+IEqY9A3/CxO/nN0iN5TLd22QBKUhm+uF75nevTMIfY0t+1CqbNje/rwT1Wsfs4L7U1acddnicJ1rFUabPSTwdo=
X-Received: by 2002:a05:6512:3b90:b0:545:60b:f385 with SMTP id
 2adb3069b0e04-5451811958emr2819287e87.29.1739484208542; Thu, 13 Feb 2025
 14:03:28 -0800 (PST)
MIME-Version: 1.0
Date: Thu, 13 Feb 2025 16:03:17 -0600
X-Gm-Features: AWEUYZm-ltwjx4ptEaNmMqX3T-q4GvUhwJ5ipYKizDCGdUr2j7ePhaJkMQPQs_8
Message-ID: <CAH2r5mshVYtTXJLFTy=0pHj_Lk=8g1dLkSKnLjNASxy+pn97WQ@mail.gmail.com>
Subject: [ANNOUNCE] cifs-utils release 7.2
To: CIFS <linux-cifs@vger.kernel.org>, 
 samba-technical <samba-technical@lists.samba.org>
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
Cc: Meetakshi Setiya <meetakshisetiyaoss@gmail.com>,
 Henrique Carvalho <henrique.carvalho@suse.com>,
 =?UTF-8?Q?Pavel_Filipensk=C3=BD?= <pfilipensky@samba.org>,
 Bharath S M <bharathsm@microsoft.com>, LKML <linux-kernel@vger.kernel.org>,
 Ritvik Budhiraja <budhirajaritviksmb@gmail.com>,
 Thiago Becker <tbecker@redhat.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

A new update, version 7.2, of cifs-utils has been released today,
bringing various security enhancements, including support for password
rotation, and better support for credential management and namespaces
and various improvements to documentation.

Links:

webpage: https://wiki.samba.org/index.php/LinuxCIFS_utils
tarball: https://download.samba.org/pub/linux-cifs/cifs-utils/
git: git://git.samba.org/cifs-utils.git
gitweb: http://git.samba.org/?p=3Dcifs-utils.git;a=3Dsummary

Detailed list of changes since version 7.1 was released:

Bharath SM (1):
      cifs-utils: Skip TGT check if valid service ticket is already availab=
le

Henrique Carvalho (3):
      docs: update actimeo description
      docs: add max_cached_dirs description
      docs: add esize description

Meetakshi Setiya (4):
      cifs-utils: support and document password2 mount option
      use enums to check password or password2 in set_password,
get_password_from_file and minor documentation additions
      Fix compiler warnings in mount.cifs
      Do not pass passwords with sec=3Dnone and sec=3Dkrb5

Pavel Filipensk=C3=BD (1):
      smbinfo: add bash completion support for filestreaminfo, keys, gettco=
ninfo

Pavel Shilovsky (1):
      cifs-utils: bump version to 7.2

Ritvik Budhiraja (2):
      CIFS.upcall to accomodate new namespace mount opt
      cifs-utils: add documentation for upcall_target

Steve French (2):
      cifs-utils: avoid using mktemp when updating mtab
      getcifsacl: fix return code check for getting full ACL

Thiago Becker (2):
      cifscreds: use continue instead of break when matching commands
      cifscreds: allow user to set the key's timeout

Thomas Petazzoni (2):
      configure.ac: libtalloc is now mandatory
      cldap_ping.c: add missing <sys/types.h> include

--=20
Thanks,

Steve

