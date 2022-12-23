Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FFB96551F5
	for <lists+samba-technical@lfdr.de>; Fri, 23 Dec 2022 16:13:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=hwzDJKbuLJxUBOmSUczzXBmKQSb/dYOEjz3hZLKgi5o=; b=oNZjuHtiHJUWQneVEEXC3n9Z/E
	DS4o0ypLwTrb1Hf66fdSAiO5iLLZSqwqiTinxZZ5eH1Fd0xNUSNomBINyT8vQfE4bpj43uRrGPL+w
	auaYDsVcEpQdHOoFkSbz8KWSslMwevdCJAY3BYIEmC/r4e9CGRtH3CE0DAAAv84uM4hjKAb49ZK25
	t2A5doUXueWoLqTX+IKPEAlZAR69Wh+cTDRdVZVm8iBEdYS6XQZt60vkj/DOxDjwZ9lKamXhKWL1Q
	lWMcCbaCQS43PbSp6dal0ZXgh2V5eA6EiYSHrXElKtFSFuvkzaUyMYFsSk3/Gm/6SDOkMoNweu/Ld
	ZabtBGfA==;
Received: from ip6-localhost ([::1]:35670 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1p8jjE-00B1hj-72; Fri, 23 Dec 2022 15:12:56 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:45646) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1p8jj9-00B1hZ-6R
 for samba-technical@lists.samba.org; Fri, 23 Dec 2022 15:12:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:To:From:CC;
 bh=hwzDJKbuLJxUBOmSUczzXBmKQSb/dYOEjz3hZLKgi5o=; b=hC3DFG4441C+OlyGOKJeCN0BqN
 BzobJ5zy3+euYZ5CmUqoVWDLfKlfBeXvhBs5qjAJ8bSEUqiXOuiF1VK1G9Ity3SHII+A9b8Ut7g/J
 mHxmwcNsjpwwC0qp/N8OZrf+mM3yaybC/hyUyH50bIO/stXcVNq48Zct4d69MFq7P6VaeMXdLIi4n
 gqASNG6CBnM4h5AU7pTbORh42d5QOllxMH82b3pHBX/H8E1D2FxWJbi99sPRQT6FVZpXTCHMY9bkq
 VYt4uCsbWaUMSuJrj9ys1a5+SE1MHO97hW8jV8HevXdIj25kzD8x3ZLWZi+C4KnJGZ02WEgtG2hAv
 xJ1zetFo8BxJ3AFzTfint+aIEV4cjQkyL6G9AEWxyjLyhIse8xRkLHustv8avZ5vAgCqaS73XJ5Oq
 WQvVm/kLAKMHl3U+N9iAgD2OR3YATPCn5eTvkWRzGeji9YQ3n1wBXDWHm9lSjksjtHucbD5mpvwe1
 Nn5ewAl7ZNjC3heeKwbBGJBp;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1p8jj7-005BEp-Mf; Fri, 23 Dec 2022 15:12:49 +0000
To: Vyacheslav Karpukhin <vyacheslav@karpukhin.com>,
 samba-technical@lists.samba.org, Andrew Walker <awalker@ixsystems.com>
Subject: Re: "access based share enum" is broken since 4.16.0
Date: Fri, 23 Dec 2022 16:12:49 +0100
Message-ID: <4452622.LvFx2qVVIh@magrathea>
In-Reply-To: <CAB5c7xqJ1DaJhCTVQn8H1RWGW_xi8kp=vZhciTAEVkHKyk1MJA@mail.gmail.com>
References: <D3FFCE09-CD20-485D-9925-6EB995A8B6E5@karpukhin.com>
 <CAB5c7xqJ1DaJhCTVQn8H1RWGW_xi8kp=vZhciTAEVkHKyk1MJA@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
From: Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Schneider <asn@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Monday, 19 December 2022 05:38:33 CET Andrew Walker via samba-technical 
wrote:
> On Sun, Dec 18, 2022 at 10:40 PM Vyacheslav Karpukhin via samba-technical <
> 
> samba-technical@lists.samba.org> wrote:
> > Hi,
> > 
> > It looks like the access-based share listing is broken in the recent
> > versions: "smbclient -L" shows no shares if this option is used. Bisecting
> > points at a7c65958a15149918415b7456d6f20ee8c9669d2. I rolled back to 4.15
> > for now.
> > 
> > Regards,
> > Vyacheslav
> 
> FWIW, I have MR with fix here:
> https://gitlab.com/samba-team/devel/samba/-/commits/anodos325-fix-access-bas
> ed-share-enum

Hi Andrew,

I'm sorry, but I don't see a MR with this fix. Also we need a bug for it and 
backport it to 4.17 and 4.16.


Best regards


	Andreas


-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



