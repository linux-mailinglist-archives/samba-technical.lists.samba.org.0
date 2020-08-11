Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA062421B4
	for <lists+samba-technical@lfdr.de>; Tue, 11 Aug 2020 23:12:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=Q6G+yB2EMY66FoYm39jRFvAH/S+lJNb5E0++XuShYkM=; b=1EC/tmQqalGOWfPX9LJUhdAxUM
	4SYPbYVJBR/jduYEjE2cd3B2GK5dTkmn32K4vMLkaOY3b9tOYBsWYLA7WBmqJh2VhkCl/FqBzEv7b
	FR1Z0skrHWOwlTlkICMP3tuFQeCR6RpIzdw51IadTMVaHV832OYWzuEHiZzTmwye86DrEaqNc1uuK
	N7xZJnhxSbe3MmeP8f1+pY+dCnpp7XhVJXXwB3+HWmnO/GAbmWwZcESh7phiVhffxVGaKhrAe5fpA
	UBNoiFiZagpRQ6aXGYttGR5sbmpQJuyAmoeJQ9IxqxubV3JukHUPfqHN8VPyflNfWnFlrCZGvWL11
	Vs+12CeQ==;
Received: from localhost ([::1]:50878 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1k5bXw-00DFpD-RB; Tue, 11 Aug 2020 21:11:00 +0000
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b]:41748) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1k5bXp-00DFp6-Bk
 for samba-technical@lists.samba.org; Tue, 11 Aug 2020 21:10:56 +0000
Received: by mail-il1-x12b.google.com with SMTP id q14so590525ilj.8
 for <samba-technical@lists.samba.org>; Tue, 11 Aug 2020 14:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=Q6G+yB2EMY66FoYm39jRFvAH/S+lJNb5E0++XuShYkM=;
 b=toyYm7SC5c13FlDTSL8CNn/K2pAfmJBWSbWOA57yRyqmKsjBhNMJ9RuccxDwrdbz02
 eCPNdts/5g55anyIPZhzJcq/cHV1hKYwUO4AfCeNefnqpEF7NEqx5C8yUU1ohasXqWKg
 ihpW6ope96jXNVMfUG46Lw32CBJit8vAjFufIOerF05cY577+qevfoVn1Xw52kOtmyGG
 bn4uwRRGeEaJWRNADnviVoEqFre9Ah8D14/A/qAqfA4/pse/kokawgrO4wrbhUUftZmJ
 /drjvJ+q0gPxcNaVeanuedF6B/xTxQYva02yOIoHC6wgnzAT+fswhjNsANRCcUSRKiEC
 YjFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Q6G+yB2EMY66FoYm39jRFvAH/S+lJNb5E0++XuShYkM=;
 b=O7v2Noe0bh0ldQl/pxLjQz95HH1Qkglkj6Oq2wy0iv8W9R1iEOv4tsOHYcQ6DXVVPM
 xszJRgwk8TPHzg6q+eIB7bmT2suvtMoR4Hnt8p37VtaUcLdnIpCOTyzoy3utX7BHcb8W
 eDS2ifP6hO/OLHTq3OIXupjKdv98pLscDGygqGsIucexEnP3DCjeOzcJOFpwPsDuDbiO
 fPBj+a4c3Mo8F/cksEPhUkv+FYKviZLIRDACuJzAxRI1KgJhZide5y1EJ3RLNalDmU6e
 PNW4F5QiiJH2BtcrM29kVDTYk4IvphHq7cqdXcCCaAKkH1gg8EPkq7ankIPDur+awuVS
 39XA==
X-Gm-Message-State: AOAM533FLysnEFaVZFUAInJ++mdJr44jNCZfqGl3CDDcoCVwpJB067gR
 NN6MurKEFMRJDvaflLNxvH88Zec/ZXC5uyef9PyQlVP5lg==
X-Google-Smtp-Source: ABdhPJy6bRxmxj6MMQmKDjX+mhVZzSUflWQZp7NbGKueN3ophnsfNzkXr3vcDkje8sSEiLoaKEn5W9Q7+bvAWp+lEf4=
X-Received: by 2002:a92:9118:: with SMTP id t24mr23948601ild.220.1597180250466; 
 Tue, 11 Aug 2020 14:10:50 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 11 Aug 2020 14:10:39 -0700
Message-ID: <CAMfpvhKQKyvzEgsyEPChU1ectmsbPeGiGKEHF2v=5hR+jC1GCQ@mail.gmail.com>
Subject: Creating a VFS backend
To: samba-technical@lists.samba.org
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
From: Matthew DeVore via samba-technical <samba-technical@lists.samba.org>
Reply-To: Matthew DeVore <matvore@google.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hello,

I'm investigating using Samba to host a custom filesystem which
currently relies on FUSE.

To get started, I wanted to make a trivial VFS backend which exposed a
few hard-coded files in a single directory. Samba is invoking
connectpath, get_realpath, and some other methods that I've
implemented but for some reason it's giving up ("it" refers to either
Samba's smbclient and the macOS SMB client). It never seems to attempt
an opendir or openat operation.

TL;DR: what VFS operation did I omit or implement wrongly that, if
fixed, will result in opendir or openat being attempted?

Here is the source code: https://gitlab.com/matvore/samba/-/commits/vfs_hello

Only the last commit is relevant - the others are hacks and tweaks to
make the code work on macOS. Detailed output follows.

Thank you,
Matt

---

This is what I tried to do in smbclient:

$ ~/samba_build/bin/smbclient -p 8111 //localhost/sambashare
Enter WORKGROUP\matvore's password:
Try "help" to get a list of possible commands.
smb: \> dir
NT_STATUS_NOT_IMPLEMENTED listing \*
smb: \> ls
NT_STATUS_NOT_IMPLEMENTED listing \*
smb: \> more foo
smb1cli_req_writev_submit: called for dialect[SMB3_11] server[localhost]
NT_STATUS_REVISION_MISMATCH opening remote file \foo
smb: \>

Here is the output of smbd:

$ sudo ~/samba_build/sbin/smbd  --foreground --port 8111 --debuglevel=1 -S
smbd version 4.14.0pre1-GIT-be59b2d19d4 started.
Copyright Andrew Tridgell and the Samba Team 1992-2020
INFO: Profiling support unavailable in this build.
daemon_ready: daemon 'smbd' finished starting up and ready to serve connections
Failed to fetch record!
idmap range not specified for domain '*'
hello_init
hello_connect
hello_realpath: '/'
hello_realpath: '/'
hello_stat: '/'
hello_fs_capabilities
hello_stat: '.'
hello_realpath: '.'
hello_connectpath: '.' '/'
hello_stat: '.'
hello_realpath: '.'
hello_connectpath: '.' '/'
hello_stat: 'foo'
hello_realpath: 'foo'
hello_connectpath: 'foo' '/'

