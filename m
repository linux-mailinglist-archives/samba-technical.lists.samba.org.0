Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4918B3387
	for <lists+samba-technical@lfdr.de>; Fri, 26 Apr 2024 11:05:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=6NNWrHZ8QYLMXcRHSm4QHBMib2eMk/fIeCbE+svUghk=; b=ZFai6jDNFetYCvBVnaLEDmAMA0
	dO9TwgP3ybzTPNVV2arV9sThJomhz4IIM1AUBPb0oA1wyjq1XQxfstDU0/Iejb9hxLKmVZ5ERyDuj
	wDkDACJz37B8mglYgwVwy206sSJ0nYPgSImQB3tyLtJaQkgUYSK+jkZoCjjsLLiD3sGsJNrtMuKRP
	eGnmkO9sYuK2+ccAs+sC7RKjvKzXCcys6DEJCtFm+W1sgSWv+7radIj2oS2fwkUwHDlVncb9AWlGc
	T+5yd8vlshzlQ6cBBrrBG6YOmKqf0vwyo6M6+owsWGdSY1dVX7FBaJDtCCu+bRcjyrlxGRsozget9
	ojlUrOaw==;
Received: from ip6-localhost ([::1]:18506 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1s0HVw-005njG-UU; Fri, 26 Apr 2024 09:05:05 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41007) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1s0HVr-005nj6-Bf
 for samba-technical@lists.samba.org; Fri, 26 Apr 2024 09:05:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1714122296;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6NNWrHZ8QYLMXcRHSm4QHBMib2eMk/fIeCbE+svUghk=;
 b=a2SO1Y/WSQU+Nd2htTqOoltlK0VCKyAUbWh/K62gTFT9U0/WuLvLGu6Vgpm1Iw12H9sFyN
 blkFoh0mc4gCOhklwvFYOGhZZ55j7R+ARjpUhXs2SySllh+mtot7CISTjcnNGLKdwGkT/Y
 sYTjVCuu64D37ZsEvwUORA1F/vRvbxE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1714122296;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6NNWrHZ8QYLMXcRHSm4QHBMib2eMk/fIeCbE+svUghk=;
 b=a2SO1Y/WSQU+Nd2htTqOoltlK0VCKyAUbWh/K62gTFT9U0/WuLvLGu6Vgpm1Iw12H9sFyN
 blkFoh0mc4gCOhklwvFYOGhZZ55j7R+ARjpUhXs2SySllh+mtot7CISTjcnNGLKdwGkT/Y
 sYTjVCuu64D37ZsEvwUORA1F/vRvbxE=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-596-6fuerLXVOliK6Ject2zWEg-1; Fri,
 26 Apr 2024 05:04:51 -0400
X-MC-Unique: 6fuerLXVOliK6Ject2zWEg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5AC5B3830095;
 Fri, 26 Apr 2024 09:04:51 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.200])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 148F1EC685;
 Fri, 26 Apr 2024 09:04:49 +0000 (UTC)
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
Content-ID: <2146095.1714122289.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable
Date: Fri, 26 Apr 2024 10:04:49 +0100
Message-ID: <2146096.1714122289@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
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

Okay I got it to install somehow by moving tmp-pkg to pkg, running lkp
install (which failed), then moving it back and running lkp install again,
which succeeded.

Running lkp split-job gives me:

/root/lkp-tests/lib/erb.rb:35: warning: Passing safe_level with the 2nd ar=
gument of ERB.new is deprecated. Do not use it, and specify other argument=
s as keyword arguments.
/root/lkp-tests/lib/erb.rb:35: warning: Passing trim_mode with the 3rd arg=
ument of ERB.new is deprecated. Use keyword argument like ERB.new(str, tri=
m_mode: ...) instead.
/root/lkp-tests/lib/erb.rb:35: warning: Passing safe_level with the 2nd ar=
gument of ERB.new is deprecated. Do not use it, and specify other argument=
s as keyword arguments.
/root/lkp-tests/lib/erb.rb:35: warning: Passing trim_mode with the 3rd arg=
ument of ERB.new is deprecated. Use keyword argument like ERB.new(str, tri=
m_mode: ...) instead.
job.yaml =3D> ./job-performance-1HDD-btrfs-cifs-filemicro_seqwriterandvarg=
am.f-b4834f12a4df607aaedc627fa9b93f3b18f664ba-debian-12-x86_64-20240206.cg=
z.yaml

It looks like some of the Ruby scripting is out of date.

David


