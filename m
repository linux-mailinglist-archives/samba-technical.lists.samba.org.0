Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B9FF67A85B
	for <lists+samba-technical@lfdr.de>; Wed, 25 Jan 2023 02:23:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=VrC6FeS6BBzcjiQ2GCIUxda5qjXhEctOPt7ZgQnystA=; b=m6bQDXDi2pOIrQdaOYUT/STpr7
	8OICdf4H6weagajg9GrbJbdmlSs8f7E63g8CFBrA6VU/HZR0l/rsfJaE9hQhhNxmSDCN160nfdkht
	1AnD7VO0dZoC5yIc12EsU+3DPZqDAnkjWMiBHnTCLWjdhK0K3YDdp8CZ/eQQ91tprHZHrxOw4QXeW
	WZLEZJnGHmVf9bEpPRgl4eLAIGLEry7R3Yi9mDJFuSfL7ccSzpWb0VZvoHFYh/RSnCfzrPXURq10q
	VJVYQfJpvcSCcwP2Ra+kxe+XW2Yaw5WhCUrqNgmNBU3B70+rz2p7wRN2bFnv7GrA6spx+f1FGtH2o
	z1fY2BZg==;
Received: from ip6-localhost ([::1]:42942 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pKUUq-002end-6l; Wed, 25 Jan 2023 01:22:40 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:22032) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pKUUl-002enU-3D
 for samba-technical@lists.samba.org; Wed, 25 Jan 2023 01:22:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=VrC6FeS6BBzcjiQ2GCIUxda5qjXhEctOPt7ZgQnystA=; b=vP2EqrMfde4Xxdh0z+Qddpq4oa
 ojS4qF69SabfMazD9d9xlJB/8CsHXFgg+E6zcm6RlRJQZ2lIBkpFwgZHduyOgfQEIr2JcvKs5Usak
 ucAdjzILrLcepXbcay8ctvVHOq2nXJV0W1KQo6W+gNF/+yFb4tV3pg+svAgqh4JKkTlgxZOw0GZWX
 9GlRsNSrDnyodM8/7EHhzuslhtIxHN65sXpxbn56BD+hr4nhxhm3BwQM70yocxeZ6wZxZg4BF46x9
 LlBIlq/M5XJVUjZzw8W0w9Tveul9LMLOAByOpN5sdt1WR6qUApaGLLkvSBdvmwjbdyiCoMDkHmYUU
 pcflNnk5DW5V0kOMFiSmgFUaAv+k4LSSes3MaIeOuLA2UmRStwBZw4GkxkEY4CJzQCbKxewU4sNIf
 MSKNF8FxKqGOcHhIfwuy5iJlS5rmxfxDKONauxGGNgTdWp0lYaG8X+UZqO1BFyZL5paYsY+lLv7/U
 xAD5772LkZa0YyIOcRuzT262;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1pKUUi-00AA06-Oy; Wed, 25 Jan 2023 01:22:33 +0000
Date: Tue, 24 Jan 2023 17:22:30 -0800
To: Andreas Schneider <asn@samba.org>
Subject: Re: [SCM] Samba Shared Repository - branch master updated
Message-ID: <Y9CEVgJd3XgnHqN6@jeremy-acer>
References: <E1pKFPN-006HUv-Jj@hrx0.samba.org>
 <c08b0b3f-8ef5-1063-5412-18e96a1809e9@samba.org>
 <1869592.tdWV9SEqCh@magrathea>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <1869592.tdWV9SEqCh@magrathea>
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Cc: Stefan Metzmacher <metze@samba.org>, samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Jan 24, 2023 at 02:50:37PM +0100, Andreas Schneider via samba-technical wrote:
>
>I suggest to use my `git review+` tool :-)
>
>https://git.cryptomilk.org/users/asn/dotfiles.git/tree/git/bin/git-review+
>
>same for signoff:
>https://git.cryptomilk.org/users/asn/dotfiles.git/tree/git/bin/git-signoff+

Great work Andreas ! Although I personally prefer to use the
"Reviewed-by: <myself>" tag as a mark I've actually read and
understood the code I've merged in my tree.

Whilst I'm reviwing someone's patch I leave off the "Reviewed-by: <myself>" tag
on patches I don't understand, and only add them once I'm
good with the code.

So doing a bulk add of "Reviewed-by: <myself>" actually breaks
my workflow.

Does anyone else do this, or am I just strange ? :-).

