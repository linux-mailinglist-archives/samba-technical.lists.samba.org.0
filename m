Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA26347D5E
	for <lists+samba-technical@lfdr.de>; Wed, 24 Mar 2021 17:12:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=Q+o3dE7AjyqHiXDn/6FSX2oOVDgFxK4EjXcq0XEyfSg=; b=RVFTvWx3kpS8vIgLcTOOJaEZEP
	HiItWgx1gEIVFqPB3G1Y5L+USqu9zEeXh6CHRZ2KlUtLOojXuYg7zotfK3MOJP8tkJwvHWYutVfuO
	lbh7mZ/9A3c6kivoKGaTySpgfZx0bvrjc8K4usd3WKpSWNZETsOQpGUVsRnEAE6tZGuhvY+GBAA6d
	4g004iZmc3m4NE4VMZwboo13DU7tSuaFxoBx8orbBbxxM/bBl3Wjh2oN4MpQBz5BnoQslLG0CyEdj
	XlQwaBrh/WCEk9Z0PQ1tVFESpfeGGZ6eK8O9Qrh09cfMho0RqsueGSJlxg4bjrrIlaTR4Mv42jdi1
	dOJE0Izg==;
Received: from ip6-localhost ([::1]:36476 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lP67q-006c4V-2i; Wed, 24 Mar 2021 16:12:54 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:60494) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lP67k-006c4N-Gn
 for samba-technical@lists.samba.org; Wed, 24 Mar 2021 16:12:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=Q+o3dE7AjyqHiXDn/6FSX2oOVDgFxK4EjXcq0XEyfSg=; b=MJZrq/m6vfpXvnWyZCHVS//fRI
 /7WtN1bd1R/xBObHTUQmoOp/N9vYUlVwu6BM8BkROCKNQyfbAWgXyZBsfCNgeyw/pzIJqriNYzh4y
 TI1Ad7PQiiEXjMW8bK+iiGxGncoVz48ofVRuvpaQghKKZFdj54nV3QA8UFqkEPLCsVOiSA7qpnKBR
 5sk2xkBo1GaRJaHSINOAEfGOCBH3dDrFdjAq+hLclYeOvbnIx7WwU3tek++Zxe8mwvLssisRF37wS
 6fKc9Afdaln54DCEKHottFndYBXG8YTV5o4U5jHMtX9ETUOFa9WUt0i5fCmnXD6aICA88Cankpw9j
 DH190neHRaquN/A1ASleTQ7kw7nvwzc55dAbNfmMsAELRKC+BJpd2Hn12+uk7zXb2QBMrIHWI6HL7
 zy//wecefw/uGbLWg8KBie+xLZGKbFJaNnPdv8aT2udSQkY6yvzTYEhO9Ib5b8SNmTiag2nnZKQgu
 v+GSeNOLeUf/GtaVDJynKUK3;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lP67j-00069h-Dq; Wed, 24 Mar 2021 16:12:47 +0000
Date: Wed, 24 Mar 2021 09:12:44 -0700
To: Andreas Schneider <asn@samba.org>
Subject: Re: Drop NIS support
Message-ID: <20210324161244.GB818616@jeremy-acer>
References: <4045140.l1vqqZ3lm0@magrathea>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <4045140.l1vqqZ3lm0@magrathea>
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, Mar 24, 2021 at 05:10:15PM +0100, Andreas Schneider via samba-technical wrote:
>Hi,
>
>could we drop NIS support for Samba 4.15?
>
>This means getting rid of lib/replace/system/nis.h and yp_*() ...

+1 from me. Let's see if anyone else is still
using it.

So the current list for 4.15 will be Tru64, HPUX, NIS.

Any more for any more ?

