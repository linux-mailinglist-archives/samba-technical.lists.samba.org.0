Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D028B3361
	for <lists+samba-technical@lfdr.de>; Fri, 26 Apr 2024 10:53:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=5XDOx+LRv/jq1Nvyq0OuXZVtvg/bIzTKjHQEeVzF+Yk=; b=Clw4eWFNYLP+KjOTeAdi12XvFM
	UhMPTkKB3+LemKDG6BPhJZ2mWGhgj/s59B9ME+iZBueT9rFubKUuUAmN16Bslj90qAYSolCfQXBx+
	hVi1fDuN/AjHwvW/oG0ITJM2lrdFrgfh0uVLwnsEPuzIMqfIF7wD75U+NAp7l277GGAeDnSwBrDH6
	DI1JJ+LAZofmqsuyPLcD/SoUB8bC5vzPiQHXrxjbPKGm45HauAoi05i9k7rt0gBb0INtowesbn9cl
	1TId4v0GlWyeDgp+ngB2u6SVjM8TwhlX2MN9J4mDiPWQ/qtegdfWYgw7CvHhtOh3/M0qREjlHcSbX
	O5192Jmg==;
Received: from ip6-localhost ([::1]:37730 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1s0HKM-005nVk-LK; Fri, 26 Apr 2024 08:53:06 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29475) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1s0HKH-005nVd-Py
 for samba-technical@lists.samba.org; Fri, 26 Apr 2024 08:53:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1714121578;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5XDOx+LRv/jq1Nvyq0OuXZVtvg/bIzTKjHQEeVzF+Yk=;
 b=TGD744Z6zmhqWBHlyzhKBQVdEzz5V2sf8dzZLDgGQ3nUaz8SGEkNa+A1Q+NGzgbjA2mdNv
 743gn0JurIhn5DBds8PTUJNLAmLCAQiJ2FR4aRB9p6Bxp925ukI8YRMo40FwJritu3twc4
 Nlkfkls7VM0GGb90zYMcmkj4bz/8G2w=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1714121578;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5XDOx+LRv/jq1Nvyq0OuXZVtvg/bIzTKjHQEeVzF+Yk=;
 b=TGD744Z6zmhqWBHlyzhKBQVdEzz5V2sf8dzZLDgGQ3nUaz8SGEkNa+A1Q+NGzgbjA2mdNv
 743gn0JurIhn5DBds8PTUJNLAmLCAQiJ2FR4aRB9p6Bxp925ukI8YRMo40FwJritu3twc4
 Nlkfkls7VM0GGb90zYMcmkj4bz/8G2w=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-373-Ri3cBZkiMNm8Eg-Jxet00Q-1; Fri,
 26 Apr 2024 04:52:54 -0400
X-MC-Unique: Ri3cBZkiMNm8Eg-Jxet00Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 43FFC293248B;
 Fri, 26 Apr 2024 08:52:54 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.200])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F3E9710000AD;
 Fri, 26 Apr 2024 08:52:52 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
In-Reply-To: <Zin4G2VYUiaYxsKQ@xsang-OptiPlex-9020>
References: <Zin4G2VYUiaYxsKQ@xsang-OptiPlex-9020>
 <202404161031.468b84f-oliver.sang@intel.com>
 <164954.1713356321@warthog.procyon.org.uk>
To: Oliver Sang <oliver.sang@intel.com>
Subject: Re: [dhowells-fs:cifs-netfs] [cifs] b4834f12a4:
 WARNING:at_fs/netfs/write_collect.c:#netfs_writeback_lookup_folio
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2145849.1714121572.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable
Date: Fri, 26 Apr 2024 09:52:52 +0100
Message-ID: <2145850.1714121572@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
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
From: David Howells via samba-technical <samba-technical@lists.samba.org>
Reply-To: David Howells <dhowells@redhat.com>
Cc: Shyam Prasad N <nspmangalore@gmail.com>, Steve French <sfrench@samba.org>,
 lkp@intel.com, linux-cifs@vger.kernel.org, Rohith
 Surabattula <rohiths.msft@gmail.com>, samba-technical@lists.samba.org,
 Jeff Layton <jlayton@kernel.org>, dhowells@redhat.com,
 linux-fsdevel@vger.kernel.org, oe-lkp@lists.linux.dev, netfs@lists.linux.dev
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

The "lkp install" didn't complete:

=3D=3D> Retrieving sources...
  -> Source is https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/li=
nux.git
  -> Cloning linux git repo...
Cloning into bare repository '/root/lkp-tests/programs/turbostat/pkg/linux=
'...
remote: Enumerating objects: 10112942, done.
remote: Counting objects: 100% (889/889), done.
remote: Compressing objects: 100% (475/475), done.
remote: Total 10112942 (delta 554), reused 549 (delta 412), pack-reused 10=
112053
Receiving objects: 100% (10112942/10112942), 2.78 GiB | 4.16 MiB/s, done.
Resolving deltas: 100% (8300839/8300839), done.
=3D=3D> WARNING: Skipping verification of source file PGP signatures.
=3D=3D> Validating source files with md5sums...
    linux ... Skipped
=3D=3D> Extracting sources...
  -> Source is https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/li=
nux.git
  -> Creating working copy of linux git repo...
fatal: '/root/lkp-tests/pkg/turbostat/linux' does not appear to be a git r=
epository
fatal: Could not read from remote repository.


I looked around under /root/lkp-tests and there's no pkg/ directory.  It s=
eems
to be using tmp-pkg instead.

Is there a way to skip the cloning of the kernel?  I already have my test
kernel running on my test machine, booted by PXE/tftp from the build tree =
on
my desktop.  Just tell me what options I need to enable.

David


