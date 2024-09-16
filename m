Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 90891979F8E
	for <lists+samba-technical@lfdr.de>; Mon, 16 Sep 2024 12:41:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=yhcNOV+akvmlPEBsqDRaj33vSsYLiwBwI4YZtgYT9s0=; b=G1WW7YsXBKL22GGLYMhQfr5lk9
	5tftLdCGudiMu7HH5V54+3uEAGPx6sUXVSFjjDB884fL3tVsBOzO5d9Gi9Uo5XRFjnwLRVBLfZN+W
	KINmyNLjXR1uXvbN935ti+Nd3zg14nHrYDLeVsA8H8h04p1S+qQn8PhKgcI48iXBIRQFFJoYttpAl
	tCtnbMUtrwTyjrSYL/NqQRlbynomlImmy95eJ4LJ6EqRlsf9NzTo1R6uTz8Vf7RhP0R6hdpl1BfDK
	eZLQhyyjMp/6OFlqy4AyFmmOX5K84O36PNttVAxc0JhIdfn5T4+WDPeQNfgs9ncVhYtY2NtRX7sfz
	BWVYS8Bw==;
Received: from ip6-localhost ([::1]:41806 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sq99T-0008N9-6u; Mon, 16 Sep 2024 10:40:15 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38527) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1sq99I-0008N1-Sv
 for samba-technical@lists.samba.org; Mon, 16 Sep 2024 10:40:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1726483201;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yhcNOV+akvmlPEBsqDRaj33vSsYLiwBwI4YZtgYT9s0=;
 b=NX2n9gvpE4g1+nd7wlCrw2Fj5TY2vmSQnFgGmE/G/j38irx5zUU7hMMzFjPF8N+//PDOr0
 lF4PtPUm3YiYYtWLQtH0rv11oG07L5hRgHHX62lqubjr+Q9TlgDHgqErq66CKdiVNC4yV1
 q1n3MBXcrf4UsuqqR+O4BcXKpGVZKmI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1726483201;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yhcNOV+akvmlPEBsqDRaj33vSsYLiwBwI4YZtgYT9s0=;
 b=NX2n9gvpE4g1+nd7wlCrw2Fj5TY2vmSQnFgGmE/G/j38irx5zUU7hMMzFjPF8N+//PDOr0
 lF4PtPUm3YiYYtWLQtH0rv11oG07L5hRgHHX62lqubjr+Q9TlgDHgqErq66CKdiVNC4yV1
 q1n3MBXcrf4UsuqqR+O4BcXKpGVZKmI=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-397-PweIc-PCNkaGCJlIzebK2g-1; Mon,
 16 Sep 2024 06:23:16 -0400
X-MC-Unique: PweIc-PCNkaGCJlIzebK2g-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 12841195422B; Mon, 16 Sep 2024 10:23:14 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.14])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id D5DB030001AB; Mon, 16 Sep 2024 10:23:09 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
In-Reply-To: <202409161629.98887b2-oliver.sang@intel.com>
References: <202409161629.98887b2-oliver.sang@intel.com>
To: kernel test robot <oliver.sang@intel.com>
Subject: Re: [linux-next:fs-next] [netfs,
 cifs] 73425800ac: xfstests.generic.080.fail
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1835553.1726482188.1@warthog.procyon.org.uk>
Date: Mon, 16 Sep 2024 11:23:08 +0100
Message-ID: <1835554.1726482188@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
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
Cc: Paulo Alcantara <pc@manguebit.com>, Steve French <sfrench@samba.org>,
 Christian Brauner <brauner@kernel.org>, lkp@intel.com,
 linux-cifs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Jeff Layton <jlayton@kernel.org>, dhowells@redhat.com,
 Linux Memory Management List <linux-mm@kvack.org>,
 samba-technical@lists.samba.org, oe-lkp@lists.linux.dev, netfs@lists.linux.dev
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

kernel test robot <oliver.sang@intel.com> wrote:

> in testcase: xfstests
> version: xfstests-x86_64-b1465280-1_20240909
> with following parameters:
> 
> 	disk: 4HDD
> 	fs: ext4
> 	fs2: smbv3
> 	test: generic-080

What's the server?  Samba, Windows, Azure or ksmbd?  It seems to matter quite
a lot.

David


