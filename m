Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4588B8AC893
	for <lists+samba-technical@lfdr.de>; Mon, 22 Apr 2024 11:12:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=Fg1lkX+Yl+2au3l9WIgkDrbEclhhUvRaRJOpVbKQwmU=; b=26s1fQjFtOgOCNxaOd3j9UW3wG
	tDFaw9eDRRpesmK6+9pk2jo/xUnUbthd03Jej60yAZJ3W9gpiRACDugMhtREab6wAGmxtySrafteD
	bJu8wzH6YNZJzfGbBR8Ps8GbuXCpFgVVmOau25/LHaG1Qzz2rtI5zwnD0HZA+yIQZsl+ejjKkOaJZ
	V7Quneq3Y+fuSBqe19hikt1eWGrYOZPZ0UAnn4grUiBO2iVommh+djKPVanFVUdTRcw+bjRLFmB+U
	HOnj7c5tIHbyhcCmv9Eb6hD/ynL+aXCthveEb7BB9V5PSYZoSvOexU1Mxe8ZljeOws3XuUxMTzs6F
	RGq1cgyA==;
Received: from ip6-localhost ([::1]:54486 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rypiN-005M8u-HC; Mon, 22 Apr 2024 09:11:55 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:53572) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rypiK-005M8n-1A
 for samba-technical@lists.samba.org; Mon, 22 Apr 2024 09:11:54 +0000
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-6f00f24f761so3416816b3a.3
 for <samba-technical@lists.samba.org>; Mon, 22 Apr 2024 02:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713777101; x=1714381901; darn=lists.samba.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=sAhBPJSRijdnJAr5urf3udqCtHinLCC7G7+oUUkBvTE=;
 b=XIBkWNSijotRRueKZ7ZixAv2ZP4nOPDlfV51VShuDrAeZZyhPyv/0v0dhHr2fJyt5t
 3UgaYPiiOWXAghpREs36wOuyJPg2/1egeTFYFyG72YdvGo6ZAyMJRtjkk0CmDlrzta31
 slqYLZfwtMseDNdrp6UGFaqpaFldd2RBPHpiOiTYQ6TqdeoImapE2Xu5hGgrWJEt3M73
 1cEBprYBaHxdsWtOx5qNFwi88syfjO1xdKqugp8Dn5no822XNcQeTHG6mqSqAEqiDVLC
 hE883JbQckDetah4AKJk5MABGs8N8RSKIfcFHJstL3fXPUufl0pUR23N78/lY2dDwXn4
 8tmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713777101; x=1714381901;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sAhBPJSRijdnJAr5urf3udqCtHinLCC7G7+oUUkBvTE=;
 b=LUMTTSYCDKamHnfvVZo8XBkJGc3tUKffo6k45vsJzpyI9JXRj7dO+z5sRylz5BHd8Y
 zBLZ/M7b3EeedyoCPivT1ePa80eijN/UdLKuKfBCteJ+An/ULVLw5LfpSVF0vE7+ViYK
 69y8cD1vVQ8gsnPAIC120R5binkVL9JN5cJn81snjNj/ji/4Wifvem1WSAQBrL41nuDt
 ahInYRujvyTic3UY1dVTUIvVRKlTe6P5U+05WN6kudA7AGTyX8TUxvCLRxcbodc76EUo
 SiA9TOvT3WDPH6+RlVNi4kwejV5/rszhS7vevCOKmI/UEz2MpWpFgAIyNOfL2vGMYKiB
 E9rw==
X-Gm-Message-State: AOJu0YyYUutJyUHbHlLKBWa6OD4LsJOfp+64TaH69NPJtdIH4d0OxfPs
 28mxktIIaVivenk6MmiZnT9pcRIRfTSkkM2WgKNLBopsgop/87GIavhAi/V63HCw4tlFOg8g6Wc
 Af8v0togfNH7pikaYQud212AvmgSj6A==
X-Google-Smtp-Source: AGHT+IHuP6vbDtcfe1Of8LuAConWZrIF2Nq416U6scFfWh4huOV3YZTEOJA+dMi+2Rp5Uwp8zCMFRx9qlkMhHVpFgUU=
X-Received: by 2002:a05:6a20:9c9a:b0:1ad:6e4:db70 with SMTP id
 mj26-20020a056a209c9a00b001ad06e4db70mr4277601pzb.29.1713777101199; Mon, 22
 Apr 2024 02:11:41 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 22 Apr 2024 11:11:30 +0200
Message-ID: <CAO9H7P_oqwoJoC_8mWNZVYZ-pxrYt9TrEt3t0LJsEvS32EorEg@mail.gmail.com>
Subject: Proposal for changes in become root
To: samba-technical@lists.samba.org
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
From: Xavi Hernandez via samba-technical <samba-technical@lists.samba.org>
Reply-To: Xavi Hernandez <xhernandez@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi all,

One of the things I've found during my work with Samba and CephFS is that
CephFS (and actually most (all ?) other remote filesystems accessed without
using a kernel mount) don't really care about the effective uid/gid of the
process because the credentials to use for a given operation are actually
passed as an additional argument to the appropriate function of the remote
filesystem.

So changing the user to root and back to the connection user adds a lot of
unnecessary system calls in some workloads.

To avoid this overhead in those cases, I'm thinking if it could be possible
to implement that functionality in a VFS module as a new stacked function.
The idea is that become_root() (and maybe other functions) instead of
directly changing the process owner, they should call the VFS stack. If
none of the VFS modules provides an alternative, then vfs_default would
implement the system call equivalent to what is currently done. On the
other hand, if a VFS module has a better way to implement that, it could
intercept the request and do whatever changes are necessary internally to
send future requests using the new credentials, but completely avoiding the
unnecessary syscalls.

I'm not sure if this could even have other benefits to implement
alternative privilege escalation methods as regular VFS modules.

What do you think ?

Thanks,

Xavi
