Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C61281A26BF
	for <lists+samba-technical@lfdr.de>; Wed,  8 Apr 2020 18:07:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=zcdx+SFox+J4FxLBHO2nD3yGln2eFsYW5zhipxzseCs=; b=CcOLuqN5+wSnnPB5X7dkrDbxAF
	M8R7ZzF++t5NvmKBbJMuq2qYCkIeTf0BlhCuloG9xWzmDVeuX0pTtNYBAgBm8Xgujl+EKVULoXm2m
	Bm2sK36977frskum+gTZXD0iaYvPWyzA//0oJyy8Uo7tnVEdZJQ7BQzOb9B/pgobs1v4AF12h7vIc
	H/z+jdtxD/dqygrVtg7iHMcYw+sSRM3JFWZXxTLbzhwVT9oWfsXDnj+523YXujzU8Qz9TtGPrVJWx
	0hlOs+a/5DWBMhRebpAHauk5adFfme8ZiMLGMJwJ4lWRg17e0ptcuJ2KiOfxCERHOpGhhI1PDJlVs
	+g0GdPog==;
Received: from localhost ([::1]:53400 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jMDEX-000BNU-Ge; Wed, 08 Apr 2020 16:07:21 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:13668) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jMDES-000BNM-Gd
 for samba-technical@lists.samba.org; Wed, 08 Apr 2020 16:07:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=zcdx+SFox+J4FxLBHO2nD3yGln2eFsYW5zhipxzseCs=; b=MLGxaUPKwA9vua40FXmU9gvBG9
 RDDXD/mv+mTamP6Ukg1xZCcP3KlFVKF5JdJdPPqACt4Ig4JGVhNLvimnTcMcq3mAeKH7VLPdGvY3M
 z2pj3LkPb1R+yyMbFsFTgqaFk5dilYDm1Ca2Uh2Rv1Ok9Qmdd8kidsP4A2cmtQOjyHjrV9hG2XohI
 3M2Md1AwF6h+JTFFv17duJaO6GmnO/OIEt6rghLQKwQgn/ClmZMO7zFWHSlkVi74u5Ft09+uXs9y/
 mr+1K4J2bx7bEfNZRpiQduSDE/KTNeRRzrB8W5B4dRxPPzCA+HVrlGr00vMdLtdbXpZjtS9+7hZa2
 YfxSPuEYbdPc9s9BqnniChBLotQu50VBuzB+Xhcq5RytJjyXdtkYo3A99zCCOLzp+YwhT/mJT5n/r
 oBabMMCcJ5fjSTT2WQH4E6kEiq8pPX6weSO+u8kIIoaDV67VG2RQtTYKcQ1srPR1poDzvuJ8XEd+Q
 29fHMliJHqmPm7PszpMgpq8j;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jMDEQ-00087U-Q6; Wed, 08 Apr 2020 16:07:15 +0000
Date: Wed, 8 Apr 2020 09:07:07 -0700
To: swen@linux.ibm.com
Subject: Re: tldap search paged
Message-ID: <20200408160707.GA8347@jeremy-acer>
References: <9ee1108dab93f774bb1be3eef0dceb711d2f1221.camel@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9ee1108dab93f774bb1be3eef0dceb711d2f1221.camel@linux.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Volker Lendecke <vl@samba.org>, uri@samba.org, metze@samba.org,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, Apr 08, 2020 at 08:32:50AM +0200, swen via samba-technical wrote:
> Hi Uri, Jeremy, Ralph, Volker, Metze and others
> 
> I know you all have received enough emails about this subject already,
> but I'd like to ask you one more time to revisit merge request 1258
> 
> https://gitlab.com/samba-team/samba/-/merge_requests/1258
> 
> I'm not sure if you all got informed about the comments / updates since
> our last conversation round, therefore, I'm sending out this friendly
> reminder :-)
> 
> As stated in the MR, I have updated the code according to your comments
> and suggestions, including an abort mechanism for the async-callback
> variant. 
> ...and yes, for now, I threw out the _all-variant.
> 
> In order to re-start my work on winbindd_ldap, which is the "real"
> project I'm working on, I need to have a stable foundation in the
> tldap-area.
> 
> So please, if your time permits, have another look at the MR.

You haven't explained *why* you need this code.

I see tldap changes, and a test which is great.

I don't see any *users* of this code.

Adding utility code without any use requirements
is a receipe for bad API's and design.

Please show the need for this code before
we go any further spending valuable review
time on it.

Jeremy.

