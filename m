Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C2D962667
	for <lists+samba-technical@lfdr.de>; Wed, 28 Aug 2024 13:53:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=xtcOzYtriZ9WqL8I/lJRoP02TrW8/k207iuQXfWTiV4=; b=oDCTGNch3byYLJ/94ix3nRSwvw
	6mryjoXHdqschdPnTxIVe+Mz4SLqO5JUoqUMUUAyRyC8dOWIYN2il1p83a5ydt2OaYkfXhH7eCRhh
	MBvQqPPDonrnVJvDikwwTz1qLK1hOndCQDcIgUYtHFnYJniLJSxX/5m8GyZJy/e1a7gipxpmjQVv8
	1o5bfXJ279nUmsx/XvkwaArU5nTJUyEiRuY7nXus0bK5jhXvTZCM4cPg8f65ALatv0P+hL7rIIKIZ
	NVTdehcHd4fV5nglkZXcl5YhWV9SxGV6Rrmcr0ff1fKylWF10ySj0zGJA6ACz8Wu8GLOqKm2uLY4P
	RooX8RYQ==;
Received: from ip6-localhost ([::1]:28512 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sjHEE-005iBK-6V; Wed, 28 Aug 2024 11:52:46 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52669) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1sjHE8-005iBD-DW
 for samba-technical@lists.samba.org; Wed, 28 Aug 2024 11:52:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1724845956;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xtcOzYtriZ9WqL8I/lJRoP02TrW8/k207iuQXfWTiV4=;
 b=BEVMOpPPW82svMBxTdYqNCVq8udNVdfIK+9Hf07l7rhd95vqHiT3uvkCW1lzKSjl2XvN4+
 DFDBljOIQlCSGGYpwYFDkE3fW0N5gJp7OAXbsfGhP0t1PKfu91itYWa2wUsm8WA9O1YVLp
 M3uZyyYwN82cAW8b2J49SMgzISw1RC0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1724845956;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xtcOzYtriZ9WqL8I/lJRoP02TrW8/k207iuQXfWTiV4=;
 b=BEVMOpPPW82svMBxTdYqNCVq8udNVdfIK+9Hf07l7rhd95vqHiT3uvkCW1lzKSjl2XvN4+
 DFDBljOIQlCSGGYpwYFDkE3fW0N5gJp7OAXbsfGhP0t1PKfu91itYWa2wUsm8WA9O1YVLp
 M3uZyyYwN82cAW8b2J49SMgzISw1RC0=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-601-hEl6BB3jOnK0z0KaSlZZzA-1; Wed,
 28 Aug 2024 07:52:31 -0400
X-MC-Unique: hEl6BB3jOnK0z0KaSlZZzA-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 97C6F1955BF2; Wed, 28 Aug 2024 11:52:29 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.30])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 058FE1955D56; Wed, 28 Aug 2024 11:52:26 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
In-Reply-To: <20240828105536.1e6226df.ddiss@samba.org>
References: <20240828105536.1e6226df.ddiss@samba.org>
 <20240823132052.3f591f2f.ddiss@samba.org>
 <Zk/ID+Ma3rlbCM1e@jeremy-HP-Z840-Workstation>
 <CAN05THTB+7B0W8fbe_KPkF0C1eKfi_sPWYyuBVDrjQVbufN8Jg@mail.gmail.com>
 <20240522185305.69e04dab@echidna> <349671.1716335639@warthog.procyon.org.uk>
 <370800.1716374185@warthog.procyon.org.uk> <20240523145420.5bf49110@echidna>
 <CAN05THRuP4_7FvOOrTxHcZXC4dWjjqStRLqS7G_iCAwU5MUNwQ@mail.gmail.com>
 <476489.1716445261@warthog.procyon.org.uk>
 <477167.1716446208@warthog.procyon.org.uk>
 <6ea739f6-640a-4f13-a9a9-d41538be9111@talpey.com>
 <af49124840aa5960107772673f807f88@manguebit.com>
 <319947.1724365560@warthog.procyon.org.uk>
 <951877.1724840740@warthog.procyon.org.uk>
To: David Disseldorp <ddiss@samba.org>
Subject: Re: Bug in Samba's implementation of FSCTL_QUERY_ALLOCATED_RANGES?
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <965292.1724845945.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable
Date: Wed, 28 Aug 2024 12:52:25 +0100
Message-ID: <965293.1724845945@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
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
Cc: Paulo Alcantara <pc@manguebit.com>, Tom Talpey <tom@talpey.com>,
 linux-cifs@vger.kernel.org,
 David Howells via samba-technical <samba-technical@lists.samba.org>,
 dhowells@redhat.com, Steve French <sfrench@samba.org>,
 Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Okay, that fixes the problem.

For reference, the file can be prepared thusly:

	xfs_io -c "pwrite 0 16M" -c "fpunch 0 1M" -c "fpunch 2M 1M" -c "fpunch 4M=
 1M" -c "fpunch 6M 1M" -c "fpunch 8M 1M" /xfstest.test/foo

and then the test run:

	xfs_io -c "seek -h 1" /xfstest.test/foo

Something like punch-hole is needed to set the sparse flag - otherwise QAR
isn't used by llseek().

So:

	Tested-by: David Howells <dhowells@redhat.com>

if you need it.

The Fedora samba version I applied this to was:

	samba-4.19.7-1.fc39.x86_64

though I had to drop the testing bits as they didn't build.

David


