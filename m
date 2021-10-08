Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B9C426F82
	for <lists+samba-technical@lfdr.de>; Fri,  8 Oct 2021 19:22:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=WwYU2detSKjHZRE+xXtlGJBaQF+egZrHkADowK8li/U=; b=pXbTP/aLIa7BLreP58xEbxwKsp
	mJ/2Xrmn2F7CrsBxIjQJsn3v3R5SVgaBppNjkLdktXgCgX2rzuu7AFyApNLeLIBjb53zEYjE4k5LN
	SeYBmMMlULouBRV3kO3LLaReOQ5l84/wXt8sUbRJ1KQ+iiy1ONEmKRakKlGxP8DH+LrK6HXtnWFmV
	vcNAIihM+fuUKTozSmTmxbL6AFkRUHnVlun3vs6PHzwWTTRkz/qduYq4nxSnuTher/wvCbWxu+T54
	mr81tuI0wXQ3yP4uvmdLuT/SIvK3ZCOqXhlOSVEx2FJRKA+iuugiCBYCacTno8Spzq3P7WHMPNu3b
	JNYlJt6Q==;
Received: from ip6-localhost ([::1]:33030 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mYtZg-005WtW-Ml; Fri, 08 Oct 2021 17:22:24 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:56244) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mYtZb-005WtN-Ss
 for samba-technical@lists.samba.org; Fri, 08 Oct 2021 17:22:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=WwYU2detSKjHZRE+xXtlGJBaQF+egZrHkADowK8li/U=; b=Rp/aChktbkBOEgufHIsfgsR108
 VEXD+HxyjFjPvWWSQIQ6u2WO7qj1yWxBehozccWRCyF+6ZcSU2sHxojh/Eqn6RQ6ervPNnjPLI2j1
 zij/Yf6hGDmeC1LsdXazvEeNYcR3hgMfMSh8mu8Ya/vVSlu/Ge6tbBFpTRW5eJIhmpMrxWPExAtvS
 cdqVLPbma+RYDO5wuIRNMHkLCL1mEtBC5cuaqsR44aELYrpZtSXA3qDcUb7bIXQFJ8/jHBAxeJCvN
 NzgHuM89INRySAFhBJ6mNk6MMBa4+ceBc9GDjESeRFirzDG7F4i9hdZcg5XyQuKS/j+0bxPa0twaT
 6xA50qmJt94xpM2FO2pFk80KdthUl3+d3+WS4FMmyFCNrr8yEKJTvXqIILpnHeis6txkPfWO1Fb/W
 7Hj9HAVjF7Mb11FYtaZMYmcbUkITQIii6PyXDYlosPDZ4N/E6mX0tcR0YwbooLb5Fmjf+WsXsRKB3
 odezu1I2iiu5G5tbqAU10NEr;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mYtZZ-000J9f-B6; Fri, 08 Oct 2021 17:22:17 +0000
Date: Fri, 8 Oct 2021 10:22:14 -0700
To: Steffen Kern <kernsteffen1990@gmail.com>
Subject: Re: Samba name mangling change?
Message-ID: <YWB+RusAvL91oAfS@jeremy-acer>
References: <CALwZj3JLO3iRDkgHeHtUpYo4j7=Ck8eo+egAu0s+LTsny4o8TA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CALwZj3JLO3iRDkgHeHtUpYo4j7=Ck8eo+egAu0s+LTsny4o8TA@mail.gmail.com>
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

On Fri, Oct 08, 2021 at 07:17:03PM +0200, Steffen Kern via samba-technical wrote:
>I wanted to use my Ubuntu machine as a file server but I have programs that
>still use 8dot3 names. I have already tested the name mangling of samba but
>with hash as method I only have 5 characters of the original name and I
>need at least 6 characters because many folders consist of preceeding
>numbers like "2100001 test". so I would be interested if there is a way to
>customize this
>thanks in advance for at least looking at it

Check out the smb.conf parameters:

mangle prefix
mangling char
mangling method

Hope this helps !

