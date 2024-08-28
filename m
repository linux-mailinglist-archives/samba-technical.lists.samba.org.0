Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CA756962523
	for <lists+samba-technical@lfdr.de>; Wed, 28 Aug 2024 12:43:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=LIA5XOnOJBX+w2ruOqm+kbWk2vXV02oxBTBE8OSAOCg=; b=4qUyJ9y0sxwRlo4H5gTSEtyMiO
	NTZV3NZK1IFYZBCl60cI7IbmnlZBexdG1mScRA+LTNpYzdrVF2CFaeDnAmSI9D+Bco65fzSFA2FVj
	WVSPPkOJHlosLW7hRl903XoTb33AToosYC3jk35CSsNvYfn8sS6ycJAqykuzE1ydXrTNwCTzny4nT
	S101t6P+AHeHhdLIY7DDwV65WLsPkXEy7OZo2odpEiL+3D9iCMPvpThJapXPTMcBvoRw4yGJ9EaCU
	RVz3orUaRt/oGPWPO8SjLX+UqsNFJcoNSXq6+XRoF9YcDO8SYOHCSe6Vi+0YkNcJwFkSXuCb6Rcup
	UAh3ImWg==;
Received: from ip6-localhost ([::1]:43170 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sjG7v-005hsK-1I; Wed, 28 Aug 2024 10:42:11 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26607) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1sjG7o-005hsD-Gw
 for samba-technical@lists.samba.org; Wed, 28 Aug 2024 10:42:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1724841721;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LIA5XOnOJBX+w2ruOqm+kbWk2vXV02oxBTBE8OSAOCg=;
 b=iKr/lGYds/FRiR9kunvZLzi9G4bCbi3v8EckBjfx8kgLTS33pn3bA3kUjWvIKnvTFHmcUf
 IGJCl9umpmNOvTlE86kuvvOXN5b4cF0v+6W16HUoKchaKhbPMwEHMke8+26E2YJq9g8ulj
 39JIcR4D531agT7+Ix9zE5Jypb2Z5fU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1724841721;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LIA5XOnOJBX+w2ruOqm+kbWk2vXV02oxBTBE8OSAOCg=;
 b=iKr/lGYds/FRiR9kunvZLzi9G4bCbi3v8EckBjfx8kgLTS33pn3bA3kUjWvIKnvTFHmcUf
 IGJCl9umpmNOvTlE86kuvvOXN5b4cF0v+6W16HUoKchaKhbPMwEHMke8+26E2YJq9g8ulj
 39JIcR4D531agT7+Ix9zE5Jypb2Z5fU=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-70-4kX-rALdOvOQwzUKJ44Phg-1; Wed,
 28 Aug 2024 06:25:47 -0400
X-MC-Unique: 4kX-rALdOvOQwzUKJ44Phg-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 512581955D4E; Wed, 28 Aug 2024 10:25:45 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.30])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 39BD519560AA; Wed, 28 Aug 2024 10:25:42 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
In-Reply-To: <20240823132052.3f591f2f.ddiss@samba.org>
References: <20240823132052.3f591f2f.ddiss@samba.org>
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
To: David Disseldorp <ddiss@samba.org>
Subject: Re: Bug in Samba's implementation of FSCTL_QUERY_ALLOCATED_RANGES?
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <951876.1724840740.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable
Date: Wed, 28 Aug 2024 11:25:40 +0100
Message-ID: <951877.1724840740@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
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

Hi David,

I tried to apply the patch to the Fedora samba rpm, but I get:

mold: error: undefined symbol: torture_assert_size_equal
>>> referenced by <artificial>
>>>               /tmp/ccVA4FUD.ltrans35.ltrans.o:(test_ioctl_sparse_qar_t=
runcated.lto_priv.0)
>>> referenced by <artificial>
>>>               /tmp/ccVA4FUD.ltrans35.ltrans.o:(test_ioctl_sparse_qar_t=
runcated.lto_priv.0)
>>> referenced by <artificial>
>>>               /tmp/ccVA4FUD.ltrans35.ltrans.o:(test_ioctl_sparse_qar_t=
runcated.lto_priv.0)
collect2: error: ld returned 1 exit status


Do I actually need the torture test patch?

David


